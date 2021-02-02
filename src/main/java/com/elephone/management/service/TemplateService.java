package com.elephone.management.service;

import com.elephone.management.domain.EnumInspection;
import com.elephone.management.domain.Transaction;
import com.elephone.management.domain.TransactionProduct;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.text.StringSubstitutor;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class TemplateService {
    private static final String PDF_TEMPLATE_PATH = "/templates/pdf/index.html";
    private static final String REPAIR_ESTIMATE_TEMPLATE_PATH = "/templates/pdf/repairEstimate.html";
    private static final String INSPECTION_TEMPLATE_PATH = "/templates/pdf/inspectionTick.html";
    private static final String INSPECTION_NOT_TICK_TEMPLATE_PATH = "/templates/pdf/inspectionNotTick.html";
    private static final String EMAIL_TEMPLATE_PATH = "/templates/email/index.html";

    private static String generateHTMLFromTemplate(String templatePath, Map<String, String> placeHolder) throws IOException {
        Resource resource = new ClassPathResource(templatePath);
        InputStream inputStream = resource.getInputStream();
        String template = new Scanner(inputStream, StandardCharsets.UTF_8.toString()).useDelimiter("\\A").next();
        StringSubstitutor templateSub = new StringSubstitutor(
                placeHolder,
                "${",
                "}"
        );
        return templateSub.replace(template);
    }

    public static String generatePdfString(Transaction transaction) throws IOException {
        String repairEstimateHtml = "";
        int index = 1;
        int total = 0;
        for (TransactionProduct product : transaction.getProducts()) {
            Map<String, String> repairPlaceholder = new HashMap<>();
            repairPlaceholder.put("i", Integer.toString(index));
            repairPlaceholder.put("number", product.getNumber());
            repairPlaceholder.put("description", product.getDescription());
            repairPlaceholder.put("price", product.getPrice());
            String repairItem = generateHTMLFromTemplate(REPAIR_ESTIMATE_TEMPLATE_PATH, repairPlaceholder);
            total += Integer.parseInt(product.getPrice());
            repairEstimateHtml += repairItem;
            index += 1;
        }

        String inspectionHtml = "";
        for (EnumInspection item : EnumInspection.values()) {
            Map<String, String> inspectionPlaceholder = new HashMap<>();
            inspectionPlaceholder.put("name", item.getDisplayName());
            if (transaction.getFinalInspections().contains(item)) {
                inspectionHtml += generateHTMLFromTemplate(INSPECTION_TEMPLATE_PATH, inspectionPlaceholder);
            } else {
                inspectionHtml += generateHTMLFromTemplate(INSPECTION_NOT_TICK_TEMPLATE_PATH, inspectionPlaceholder);
            }
        }

        String createdBy = transaction.getCreatedBy().getFirstName() + " " + transaction.getCreatedBy().getLastName();

        Map<String, String> pdfPlaceholder = new HashMap<>();

        //Transaction form
        pdfPlaceholder.put("website", "www.elephone.com.au");
        pdfPlaceholder.put("customerName", transaction.getCustomer().getName());
        pdfPlaceholder.put("customerContact", transaction.getCustomer().getContact());
        pdfPlaceholder.put("customerEmail", transaction.getCustomer().getEmail());
        pdfPlaceholder.put("device", StringUtils.isEmpty(transaction.getDevice().getName()) ? "N/A" : transaction.getDevice().getName());
        pdfPlaceholder.put("color", StringUtils.isEmpty(transaction.getDevice().getColor()) ? "N/A" : transaction.getDevice().getColor());
        pdfPlaceholder.put("imei", StringUtils.isEmpty(transaction.getDevice().getImei()) ? "N/A" : transaction.getDevice().getImei());
        pdfPlaceholder.put("passcode", StringUtils.isEmpty(transaction.getDevice().getPasscode()) ? "N/A" : transaction.getDevice().getPasscode());
        pdfPlaceholder.put("battery", StringUtils.isEmpty(transaction.getBattery()) ? "N/A" : transaction.getBattery());
        pdfPlaceholder.put("reference", transaction.getReference());
        pdfPlaceholder.put("date", transaction.getCreatedDate().toString());
        pdfPlaceholder.put("resolution", StringUtils.isEmpty(transaction.getResolution()) ? "N/A" : transaction.getResolution());
        pdfPlaceholder.put("comment", StringUtils.isEmpty(transaction.getAdditionInfo()) ? "N/A" : transaction.getAdditionInfo());
        pdfPlaceholder.put("issue", StringUtils.isEmpty(transaction.getIssue()) ? "N/A" : transaction.getIssue());
        pdfPlaceholder.put("deposit", transaction.getDeposit());
        pdfPlaceholder.put("balance", Integer.toString(total - Integer.parseInt(transaction.getDeposit())));
        pdfPlaceholder.put("total", Integer.toString(total));
        pdfPlaceholder.put("confSignature", transaction.getConfSignature());
        pdfPlaceholder.put("receivedBy", createdBy);
        pdfPlaceholder.put("inspection", inspectionHtml);
        pdfPlaceholder.put("repairEstimate", repairEstimateHtml);

        //Store info
        pdfPlaceholder.put("storeContact", transaction.getStore().getContact());
        pdfPlaceholder.put("storeEmail", transaction.getStore().getEmail());
        pdfPlaceholder.put("storeName", transaction.getStore().getName());
        pdfPlaceholder.put("storeAddress", transaction.getStore().getAddress());
        pdfPlaceholder.put("storeSuburb", transaction.getStore().getSuburb());
        pdfPlaceholder.put("storeState", transaction.getStore().getState());
        pdfPlaceholder.put("storePostcode", transaction.getStore().getPostcode());
        pdfPlaceholder.put("storeWarranty", transaction.getStore().getWarranty().toString());
        pdfPlaceholder.put("storeAbn", transaction.getStore().getAbn());
        pdfPlaceholder.put("storeCompanyName", transaction.getStore().getCompanyName());
        return generateHTMLFromTemplate(PDF_TEMPLATE_PATH, pdfPlaceholder);
    }

    public static String generateEmailString(Transaction transaction) throws IOException {
        Map<String, String> emailPlaceholder = new HashMap<>();

        //Replace ${name} to customer name.
        emailPlaceholder.put("name", transaction.getCustomer().getName());
        emailPlaceholder.put("storeName", transaction.getStore().getName());
        emailPlaceholder.put("address", transaction.getStore().getAddress());
        emailPlaceholder.put("suburb", transaction.getStore().getSuburb());
        emailPlaceholder.put("state", transaction.getStore().getState());
        emailPlaceholder.put("postcode", transaction.getStore().getPostcode());
        emailPlaceholder.put("contact", transaction.getStore().getContact());

        return generateHTMLFromTemplate(EMAIL_TEMPLATE_PATH, emailPlaceholder);
    }
}
