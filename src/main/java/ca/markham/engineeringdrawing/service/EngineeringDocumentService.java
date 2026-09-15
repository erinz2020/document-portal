package ca.markham.engineeringdrawing.service;

import ca.markham.engineeringdrawing.dto.EngineeringDocumentDto;
import ca.markham.engineeringdrawing.entity.EngineeringDocument;
import ca.markham.engineeringdrawing.repository.EngineeringDocumentRepository;
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
