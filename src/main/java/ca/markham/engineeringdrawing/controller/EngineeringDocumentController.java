package ca.markham.engineeringdrawing.controller;

import ca.markham.engineeringdrawing.dto.EngineeringDocumentDto;
import ca.markham.engineeringdrawing.service.EngineeringDocumentService;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/engineering-documents")
public class EngineeringDocumentController {
    private final EngineeringDocumentService service;

    public EngineeringDocumentController(EngineeringDocumentService service) {
        this.service = service;
    }

    @GetMapping("/design-criteria")
    public List<EngineeringDocumentDto> getDesignCriteria() {
        return service.getDesignCriteria();
    }
}
