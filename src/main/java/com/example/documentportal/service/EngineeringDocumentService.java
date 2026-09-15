package com.example.documentportal.service;

import com.example.documentportal.dto.EngineeringDocumentDto;
import com.example.documentportal.entity.EngineeringDocument;
import com.example.documentportal.repository.EngineeringDocumentRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class EngineeringDocumentService {
    private final EngineeringDocumentRepository repository;

    public EngineeringDocumentService(EngineeringDocumentRepository repository) {
        this.repository = repository;
    }

    public List<EngineeringDocumentDto> getDesignCriteria() {
        return getBySubDescription("Design Criteria");
    }

    public List<EngineeringDocumentDto> getBySubDescription(String subDescription) {
        String searchValue = subDescription == null || subDescription.isBlank()
                ? "Design Criteria"
                : subDescription.trim();

        List<EngineeringDocument> documents =
                repository.findBySubDescriptionOrderByAttachmentDescription(searchValue);

        return documents.stream()
                .map(document -> new EngineeringDocumentDto(
                        document.getAttachmentRsn(),
                        document.getAttachmentDescription()
                ))
                .toList();
    }
}

