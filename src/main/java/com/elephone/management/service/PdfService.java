package com.elephone.management.service;

import com.itextpdf.html2pdf.HtmlConverter;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;

@Service
public class PdfService {

    public byte[] generatePdfByte(String htmlString) {
        ByteArrayOutputStream target = new ByteArrayOutputStream();

        HtmlConverter.convertToPdf(htmlString, target);

        return target.toByteArray();
    }
}