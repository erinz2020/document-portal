package ca.markham.engineeringdrawing.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ENGINEERING_DATA_VIEW")
public class EngineeringDocument {
    @Id
    @Column(name = "ATTACHMENTRSN")
    private Long attachmentRsn;

    @Column(name = "FOLDERRSN")
    private Long folderRsn;

    @Column(name = "FOLDERDESC")
    private String folderDescription;

    @Column(name = "SUBDESC")
    private String subDescription;

    @Column(name = "WORKDESC")
    private String workDescription;

    @Column(name = "ATTACHMENTDESC")
    private String attachmentDescription;

    @Column(name = "ATTACHMENTDETAIL")
    private String attachmentDetail;

    @Column(name = "DOSPATH")
    private String dosPath;

    public Long getAttachmentRsn() {
        return attachmentRsn;
    }

    public void setAttachmentRsn(Long attachmentRsn) {
        this.attachmentRsn = attachmentRsn;
    }

    public Long getFolderRsn() {
        return folderRsn;
    }

    public void setFolderRsn(Long folderRsn) {
        this.folderRsn = folderRsn;
    }

    public String getFolderDescription() {
        return folderDescription;
    }

    public void setFolderDescription(String folderDescription) {
        this.folderDescription = folderDescription;
    }

    public String getSubDescription() {
        return subDescription;
    }

    public void setSubDescription(String subDescription) {
        this.subDescription = subDescription;
    }

    public String getWorkDescription() {
        return workDescription;
    }

    public void setWorkDescription(String workDescription) {
        this.workDescription = workDescription;
    }

    public String getAttachmentDescription() {
        return attachmentDescription;
    }

    public void setAttachmentDescription(String attachmentDescription) {
        this.attachmentDescription = attachmentDescription;
    }

    public String getAttachmentDetail() {
        return attachmentDetail;
    }

    public void setAttachmentDetail(String attachmentDetail) {
        this.attachmentDetail = attachmentDetail;
    }

    public String getDosPath() {
        return dosPath;
    }

    public void setDosPath(String dosPath) {
        this.dosPath = dosPath;
    }
}
