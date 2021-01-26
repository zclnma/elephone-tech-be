package com.elephone.management.service;

import java.io.*;

import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import org.jsoup.Jsoup;
import org.jsoup.helper.W3CDom;
import org.jsoup.nodes.Document;
import org.xhtmlrenderer.pdf.ITextRenderer;

public class PdfService {

    private File generatedPDF;
    private String TEMP_FOLDER = System.getProperty("java.io.tmpdir");

    public File getGeneratedPDF() {
        return generatedPDF;
    }

    public void setGeneratedPDF(File generatedPDF) {
        this.generatedPDF = generatedPDF;
    }

    public PdfService(String htmlString, String fileName) throws IOException {
//        FileWriter myWriter = new FileWriter(tempHtmlPath, false);
//        myWriter.write(htmlString);
//        myWriter.close();
//
//        Document doc = Jsoup.parse(tempHtmlPath, String.valueOf(10000));
//        PdfRendererBuilder builder = new PdfRendererBuilder();
//        builder.useFastMode();
//        builder.withW3cDocument(new W3CDom().fromJsoup(doc), tempHtmlPath);
//        builder.toStream(fos);
//        builder.run();
//        fos.close();
//

        String tempPdfPath = TEMP_FOLDER + fileName;
        FileOutputStream fos = new FileOutputStream(tempPdfPath);
        // Make the PDF file

        Document document = Jsoup.parse(htmlString);
        document.outputSettings().syntax(Document.OutputSettings.Syntax.xml);

        ITextRenderer it = new ITextRenderer();
        it.setDocumentFromString(document.html());
        it.layout();
        it.createPDF(fos);
        fos.close();

        // Set the PDF generated file to this PdfConverter instance
        setGeneratedPDF(new File(tempPdfPath));
    }
}