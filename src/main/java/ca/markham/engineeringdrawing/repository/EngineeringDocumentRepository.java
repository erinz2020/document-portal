package ca.markham.engineeringdrawing.repository;

import ca.markham.engineeringdrawing.entity.EngineeringDocument;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EngineeringDocumentRepository extends JpaRepository<EngineeringDocument, Long> {
    List<EngineeringDocument> findBySubDescriptionOrderByAttachmentDescription(String subDescription);
}
