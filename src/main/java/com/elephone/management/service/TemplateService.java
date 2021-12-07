package com.elephone.management.service;

import com.elephone.management.domain.RepairType;
import com.elephone.management.domain.Transaction;
import com.elephone.management.domain.TransactionProduct;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.text.StringSubstitutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static org.springframework.transaction.annotation.Propagation.REQUIRES_NEW;

@Service
public class TemplateService {
    private static final String PDF_TEMPLATE_PATH = "/templates/pdf/index.html";
    private static final String REPAIR_ESTIMATE_TEMPLATE_PATH = "/templates/pdf/repairEstimate.html";
    private static final String INSPECTION_TEMPLATE_PATH = "/templates/pdf/inspectionTick.html";
    private static final String INSPECTION_NOT_TICK_TEMPLATE_PATH = "/templates/pdf/inspectionNotTick.html";
    private static final String CHECKED = "/templates/pdf/checked.html";
    private static final String NOT_CHECKED = "/templates/pdf/notChecked.html";
    private static final String EMAIL_TEMPLATE_PATH = "/templates/email/index.html";

    private final RepairTypeService repairTypeService;

    @Autowired
    public TemplateService(RepairTypeService repairTypeService) {
        this.repairTypeService = repairTypeService;
    }

    private String generateAgreement(String type, Integer warranty) {
        return "authorisation".equalsIgnoreCase(type) ? "I accept that Elephone is not responsible for any loss, corruption or breach of\n" +
                "                    the data on my product during service. I assume the risk that the data on my product may be lost,\n" +
                "                    corrupted or compromised during service. By signing below, I agree that the repair Terms and\n" +
                "                    Conditions on the reverse side of this page will apply to the service of the product identified\n" +
                "                    above; Elephone is not responsible for any loss, corruption or breach of the data on my product\n" +
                "                    during service as loss of data may occur as a result of the service, it is my responsibility to make\n" +
                "                    backup copy of my data before bringing my product to Elephone for service. Warranty is valid for any\n" +
                "                    parts used for repair. Does not cover any physical or water damage. I hereby authorise Elephone to\n" +
                "                    proceed with the service." : "Thank you for choosing Elephone for the repair of your product.<br /> " +
                "                    To ensure the highest level of quality and reliability, all work is performed by Elephone technicians using compatible / equivalent / original parts. <br />" +
                "                    Note: The items identified above have been exchanged by Elephone for new or refurbished parts or products. Any applicable cost is indicated adjacent to the part(s) or product description. Warranty Period: " + warranty.toString() + " calendar days. <br />" +
                "                    I confirm the product has been repaired. I am satisfied with the service conducted on the device.<br />" +
                "                    I understood and agreed with the warranty Terms and Conditions stated for this service, will accept and follow the Elephone warranty procedure.";
    }

    private String generateHTMLFromTemplate(String templatePath, Map<String, String> placeHolder) throws IOException {
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

    public String generatePdfString(Transaction transaction, String type) throws IOException {
        StringBuilder repairEstimateHtml = new StringBuilder();
        int index = 1;
        float total = 0;
        for (TransactionProduct product : transaction.getProducts()) {
            Map<String, String> repairPlaceholder = new HashMap<>();
            repairPlaceholder.put("i", Integer.toString(index));
            repairPlaceholder.put("number", StringUtils.isEmpty(product.getNumber()) ? "1" : product.getNumber());
            repairPlaceholder.put("description", StringUtils.isEmpty(product.getDescription()) ? "N/A" : product.getDescription());
            repairPlaceholder.put("price", StringUtils.isEmpty(product.getPrice()) ? "0" : product.getPrice());
            String repairItem = generateHTMLFromTemplate(REPAIR_ESTIMATE_TEMPLATE_PATH, repairPlaceholder);
            total += Float.parseFloat(StringUtils.isEmpty(product.getPrice()) ? "0.00" : product.getPrice());
            repairEstimateHtml.append(repairItem);
            index += 1;
        }

        StringBuilder inspectionHtml = new StringBuilder();
        List<RepairType> repairTypes = repairTypeService.list();
        for (RepairType item : repairTypes) {
            Map<String, String> inspectionPlaceholder = new HashMap<>();
            inspectionPlaceholder.put("name", item.getDisplayName());
            if ("authorisation".equalsIgnoreCase(type)) {
                if (transaction.getInitInspections().contains(item.getKey())) {
                    inspectionHtml.append(generateHTMLFromTemplate(INSPECTION_TEMPLATE_PATH, inspectionPlaceholder));
                } else {
                    inspectionHtml.append(generateHTMLFromTemplate(INSPECTION_NOT_TICK_TEMPLATE_PATH, inspectionPlaceholder));
                }
            } else {
                if (transaction.getFinalInspections().contains(item.getKey())) {
                    inspectionHtml.append(generateHTMLFromTemplate(INSPECTION_TEMPLATE_PATH, inspectionPlaceholder));
                } else {
                    inspectionHtml.append(generateHTMLFromTemplate(INSPECTION_NOT_TICK_TEMPLATE_PATH, inspectionPlaceholder));
                }
            }
        }

        Map<String, String> pdfPlaceholder = new HashMap<>();

        //Transaction form
        pdfPlaceholder.put("website", "www.elephone.com.au");
        pdfPlaceholder.put("type", "authorisation".equalsIgnoreCase(type) ? "Authorisation" : "Confirmation");
        pdfPlaceholder.put("customerName", transaction.getCustomer().getName());
        pdfPlaceholder.put("customerContact", transaction.getCustomer().getContact());
        pdfPlaceholder.put("customerEmail", transaction.getCustomer().getEmail());
        pdfPlaceholder.put("device", StringUtils.isEmpty(transaction.getDevice().getName()) ? "N/A" : transaction.getDevice().getName());
        pdfPlaceholder.put("color", StringUtils.isEmpty(transaction.getDevice().getColor()) ? "N/A" : transaction.getDevice().getColor());
        pdfPlaceholder.put("imei", StringUtils.isEmpty(transaction.getDevice().getImei()) ? "N/A" : transaction.getDevice().getImei());
        pdfPlaceholder.put("passcode", StringUtils.isEmpty(transaction.getDevice().getPasscode()) ? "N/A" : transaction.getDevice().getPasscode());
        pdfPlaceholder.put("battery", StringUtils.isEmpty(transaction.getBattery()) ? "N/A" : transaction.getBattery());
        pdfPlaceholder.put("reference", transaction.getReference());
        LocalDateTime createdDate = transaction.getCreatedDate();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        pdfPlaceholder.put("date", createdDate.format(formatter));
        pdfPlaceholder.put("resolution", StringUtils.isEmpty(transaction.getResolution()) ? "N/A" : transaction.getResolution());
        pdfPlaceholder.put("comment", StringUtils.isEmpty(transaction.getAdditionInfo()) ? "N/A" : transaction.getAdditionInfo());
        pdfPlaceholder.put("issue", StringUtils.isEmpty(transaction.getIssue()) ? "N/A" : transaction.getIssue());
        pdfPlaceholder.put("deposit", StringUtils.isEmpty(transaction.getDeposit()) ? "N/A" : transaction.getDeposit());
        pdfPlaceholder.put("signature", "authorisation".equalsIgnoreCase(type) ? transaction.getAuthSignature() : transaction.getConfSignature());
        pdfPlaceholder.put("inspection", inspectionHtml.toString());
        pdfPlaceholder.put("repairEstimate", repairEstimateHtml.toString());
        pdfPlaceholder.put("warrantyPeriod", transaction.getWarrantyPeriod());
        float memberBenefits = 0.00f;
        if (transaction.getMembership()){
            memberBenefits = (float)(Math.round(total * 0.05 * 100))/100;
        }
        pdfPlaceholder.put("memberBenefits", Float.toString(memberBenefits));
        total = total - memberBenefits;
        pdfPlaceholder.put("total", Float.toString((Math.round(total * 100f) / 100f)));
        float balance = total - Float.parseFloat(StringUtils.isEmpty(transaction.getDeposit()) ? "0.00" : transaction.getDeposit());
        pdfPlaceholder.put("balance", Float.toString((float)(Math.round(balance * 100))/100));
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
        StringBuilder membershipCheckHtml = new StringBuilder();
        StringBuilder notificationCheckHtml = new StringBuilder();
        StringBuilder isSoakingCheckHtml = new StringBuilder();
        if (transaction.getMembership()) {
            membershipCheckHtml.append(generateHTMLFromTemplate(CHECKED, null));
        } else {
            membershipCheckHtml.append(generateHTMLFromTemplate(NOT_CHECKED, null));
        }
        if (transaction.getNotification()) {
            notificationCheckHtml.append(generateHTMLFromTemplate(CHECKED, null));
        } else {
            notificationCheckHtml.append(generateHTMLFromTemplate(NOT_CHECKED, null));
        }
        if (transaction.getIsSoaking()){
            isSoakingCheckHtml.append(generateHTMLFromTemplate(CHECKED, null));
        }else{
            isSoakingCheckHtml.append(generateHTMLFromTemplate(NOT_CHECKED, null));
        }
        pdfPlaceholder.put("membership", membershipCheckHtml.toString());
        pdfPlaceholder.put("notification", notificationCheckHtml.toString());
        pdfPlaceholder.put("isSoaking", isSoakingCheckHtml.toString());
        //Agreement
        pdfPlaceholder.put("agreement", generateAgreement(type, transaction.getStore().getWarranty()));
        pdfPlaceholder.put("pickupTime", transaction.getPickupTime());
        String pickupTime = transaction.getPickupTime();
        String warrantyPeriod = transaction.getWarrantyPeriod();
        String warrantyExpiryDate = "";
        if (pickupTime != null && !pickupTime.equals("") && !pickupTime.equals("false") && warrantyPeriod != null && !warrantyPeriod.equals("") && !warrantyPeriod.equals("false") && !warrantyPeriod.equals("No Warranty")){
            String[] warrantyPeriodArr = warrantyPeriod.split(" ");
            long warrantyPeriodDay = Long.valueOf(warrantyPeriodArr[0]);
            try {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date pickupTimeDate = format.parse(pickupTime.replace("/", "-"));
                long time = pickupTimeDate.getTime(); // 得到指定日期的毫秒数
                long day = warrantyPeriodDay * 24 * 60 * 60 * 1000; // 要加上的天数转换成毫秒数
                time += day; // 相加得到新的毫秒数
                warrantyExpiryDate = format.format(new Date(time));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        pdfPlaceholder.put("warrantyExpiryDate", warrantyExpiryDate);
        pdfPlaceholder.put("batteryHealth", transaction.getBatteryHealth());
        return generateHTMLFromTemplate(PDF_TEMPLATE_PATH, pdfPlaceholder);
    }

    public String generateEmailString(Transaction transaction, String type) throws IOException {
        Map<String, String> emailPlaceholder = new HashMap<>();

        emailPlaceholder.put("title", "authorisation".equalsIgnoreCase(type) ? "Authorisation Email" : "Confirmation/Repair Finished");
        emailPlaceholder.put("subject", "authorisation".equalsIgnoreCase(type) ? "Your repair at Elephone" : "Your repair has been finalised!");
        emailPlaceholder.put("firstParagraph", "authorisation".equalsIgnoreCase(type) ? "Your repair request has been received!" : "Please find attached the work confirmation form for your device. Please save this file for warranty purposes.");
        emailPlaceholder.put("secondParagraph", "authorisation".equalsIgnoreCase(type) ? "Thank you for choosing Elephone to service your device. Please see the attached copy of the repair authorisation form. Our mission is to deliver the best repair service to our customers. If you have any questions or feedback please don’t hesitate to give us a call or message us!" : "Thanks again for choosing Elephone, we’re always here to answer any questions you have about your devices simply come chat to our friendly staff or message us online, we’re here to help.");
        emailPlaceholder.put("name", transaction.getCustomer().getName());
        emailPlaceholder.put("storeName", transaction.getStore().getName());
        emailPlaceholder.put("address", transaction.getStore().getAddress());
        emailPlaceholder.put("suburb", transaction.getStore().getSuburb());
        emailPlaceholder.put("state", transaction.getStore().getState());
        emailPlaceholder.put("postcode", transaction.getStore().getPostcode());
        emailPlaceholder.put("contact", transaction.getStore().getContact());
        emailPlaceholder.put("type", "authorisation".equalsIgnoreCase(type) ? "Authorisation" : "Confirmation");

        return generateHTMLFromTemplate(EMAIL_TEMPLATE_PATH, emailPlaceholder);
    }
}
