package com.elephone.management.service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.text.StringSubstitutor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.MediaType;
import org.xhtmlrenderer.pdf.ITextRenderer;

/**
 * PdfConverter
 * Extends this to implement additional to make the map to replace template
 * expressions
 */
public class PdfService {

    private File generatedPDF;
    private String pdfName;
    private String TEMP_FOLDER = System.getProperty("java.io.tmpdir");

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
        Resource resource = new ClassPathResource("/templates/attachment.html");
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

    public void writePdfToResponse(
            HttpServletResponse response
    ) throws IOException {
        try (
                FileInputStream fis =
                        new FileInputStream(getGeneratedPDF())
        ) {
            response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            response.setHeader(
                    "Content-Disposition",
                    "inline; filename=" + getPdfName()
            );
            response.addHeader(
                    "Content-Length",
                    Long.toString(getGeneratedPDF().length())
            );
            ServletOutputStream servletOutputStream =
                    response.getOutputStream();
            int read = 0;
            byte[] bytes = new byte[1024];
            while ((read = fis.read(bytes)) != -1) {
                servletOutputStream.write(bytes, 0, read);
            }
            response.flushBuffer();
        } catch (IOException ioe) {
            response.setContentType(MediaType.TEXT_PLAIN_VALUE);
            response.getWriter().print("Cannot render PDF file.");
            response.flushBuffer();
        } finally {
            // Delete generated PDF after writing it to the response
            getGeneratedPDF().delete();
        }
    }
}