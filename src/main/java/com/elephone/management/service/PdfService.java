package com.elephone.management.service;

import com.itextpdf.html2pdf.HtmlConverter;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;

@Service
public class PdfService {

    public byte[] generatePdfByte(String htmlString) {
        ByteArrayOutputStream target = new ByteArrayOutputStream();

//        /*Setup converter properties. */
//        ConverterProperties converterProperties = new ConverterProperties();
//        converterProperties.setBaseUri("http://localhost:8080");

        HtmlConverter.convertToPdf(htmlString, target);

        return target.toByteArray();
    }
}