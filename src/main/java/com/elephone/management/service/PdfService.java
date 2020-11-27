package com.elephone.management.service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Scanner;

import org.apache.commons.text.StringSubstitutor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ClassPathResource;
import org.xhtmlrenderer.pdf.ITextRenderer;

public class PdfService {

    private File generatedPDF;
    private String pdfName;
    private String TEMP_FOLDER = System.getProperty("java.io.tmpdir");
    private String ATTACHMENT_TEMPLATE_URL = "/templates/attachment.html";

    public File getGeneratedPDF() {
        return generatedPDF;
    }

    public void setGeneratedPDF(File generatedPDF) {
        this.generatedPDF = generatedPDF;
    }

    public String getPdfName() {
        return pdfName;
    }

    public void setPdfName(String pdfName) {
        this.pdfName = pdfName;
    }

    public PdfService(Map<String, String> placeholder, String fileName) throws IOException {
        setPdfName(fileName);
        Resource resource = new ClassPathResource(ATTACHMENT_TEMPLATE_URL);
        InputStream inputStream = resource.getInputStream();
        // Fetch HTML template
        String html = new Scanner(inputStream, StandardCharsets.UTF_8.toString()).useDelimiter("\\A").next();
        StringSubstitutor sub = new StringSubstitutor(
                placeholder,
                "${",
                "}"
        );
        String resolvedString = sub.replace(html);

        // Make the PDF file
        FileOutputStream fos = new FileOutputStream(TEMP_FOLDER + fileName);
        ITextRenderer it = new ITextRenderer();
        it.setDocumentFromString(resolvedString);
        it.layout();
        it.createPDF(fos);
        fos.close();

        // Set the PDF generated file to this PdfConverter instance
        setGeneratedPDF(new File(TEMP_FOLDER + fileName));
    }
}