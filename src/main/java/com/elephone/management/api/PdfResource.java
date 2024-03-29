package com.elephone.management.api;

import com.elephone.management.service.TransactionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/pdf")
@Api(tags = "Transaction management")
public class PdfResource {

    private final TransactionService transactionService;

    @Autowired
    public PdfResource(TransactionService transactionService) {
        this.transactionService = transactionService;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "Generate Pdf of an transaction", notes = "Generate Pdf of an transaction")
    public ResponseEntity<byte[]> generatePdf(@PathVariable UUID id) throws IOException {
        byte[] pdfBytes = transactionService.getTransactionPdfByte(id);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDisposition(ContentDisposition.builder("inline").filename("Confirmation.pdf").build());
        return new ResponseEntity<>(pdfBytes, headers, HttpStatus.OK);
    }
}
