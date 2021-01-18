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
    private String TEMP_FOLDER = System.getProperty("java.io.tmpdir");

    public File getGeneratedPDF() {
        return generatedPDF;
    }

    public void setGeneratedPDF(File generatedPDF) {
        this.generatedPDF = generatedPDF;
    }

    public PdfService(String htmlString, String fileName) throws IOException {
        // Make the PDF file
        FileOutputStream fos = new FileOutputStream(TEMP_FOLDER + fileName);
        ITextRenderer it = new ITextRenderer();
        it.setDocumentFromString(htmlString);
        it.layout();
        it.createPDF(fos);
        fos.close();

        // Set the PDF generated file to this PdfConverter instance
        setGeneratedPDF(new File(TEMP_FOLDER + fileName));
    }
}