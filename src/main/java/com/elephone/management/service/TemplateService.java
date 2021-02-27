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

    private static String generateAgreement(String type) {
        return type == "confirmation" ? "I accept that Elephone is not responsible for any loss, corruption or breach of\n" +
                "                    the data on my product during service. I assume the risk that the data on my product may be lost,\n" +
                "                    corrupted or compromised during service. By signing below, I agree that the repair Terms and\n" +
                "                    Conditions on the reverse side of this page will apply to the service of the product identified\n" +
                "                    above; Elephone is not responsible for any loss, corruption or breach of the data on my product\n" +
                "                    during service as loss of data may occur as a result of the service, it is my responsibility to make\n" +
                "                    backup copy of my data before bringing my product to Elephone for service. Warranty is valid for any\n" +
                "                    parts used for repair. Does not cover any physical or water damage. I hereby authorise Elephone to\n" +
                "                    proceed with the service." : "I accept that Elephone is not responsible for any loss, corruption or breach of the data on my product during service. I assume the risk that the data on my product may be lost, corrupted or compromised during service. By signing below, I agree that the repair Terms and Conditions on the reverse side of this page will apply to the service of the product identified above; Elephone is not responsible for any loss, corruption or\n" +
                "breach of the data on my product during service as loss of data may occur as a result of the service, it is my responsibility to make backup copy of my data before bringing my product to Elephone for service. Warranty is valid for any parts used for repair. Does not cover any physical or water damage. I hereby authorise Elephone to proceed with the service.";
    }

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

    public static String generatePdfString(Transaction transaction, String type) throws IOException {
        String repairEstimateHtml = "";
        int index = 1;
        int total = 0;
        for (TransactionProduct product : transaction.getProducts()) {
            Map<String, String> repairPlaceholder = new HashMap<>();
            repairPlaceholder.put("i", Integer.toString(index));
            repairPlaceholder.put("number", StringUtils.isEmpty(product.getNumber()) ? "1" : product.getNumber());
            repairPlaceholder.put("description", StringUtils.isEmpty(product.getDescription()) ? "N/A" : product.getDescription());
            repairPlaceholder.put("price", StringUtils.isEmpty(product.getPrice()) ? "0" : product.getPrice());
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
        pdfPlaceholder.put("deposit", StringUtils.isEmpty(transaction.getDeposit()) ? "N/A" : transaction.getDeposit());
        pdfPlaceholder.put("balance", Integer.toString(total - Integer.parseInt(StringUtils.isEmpty(transaction.getDeposit()) ? "0" : transaction.getDeposit())));
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

        //Agreement
        pdfPlaceholder.put("agreement", generateAgreement(type));

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
