package com.elephone.management.service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Scanner;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import org.apache.commons.text.StringSubstitutor;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

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