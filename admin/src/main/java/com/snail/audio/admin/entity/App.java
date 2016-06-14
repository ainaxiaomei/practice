package com.snail.audio.admin.entity;

public class App {
    private Integer appid;

    private Integer companyId;

    private String contacts;

    private String description;

    private Integer beginUid;

    private Integer curUid;

    private Integer endUid;

    private Boolean occupied;

    public Integer getAppid() {
        return appid;
    }

    public void setAppid(Integer appid) {
        this.appid = appid;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getBeginUid() {
        return beginUid;
    }

    public void setBeginUid(Integer beginUid) {
        this.beginUid = beginUid;
    }

    public Integer getCurUid() {
        return curUid;
    }

    public void setCurUid(Integer curUid) {
        this.curUid = curUid;
    }

    public Integer getEndUid() {
        return endUid;
    }

    public void setEndUid(Integer endUid) {
        this.endUid = endUid;
    }

    public Boolean getOccupied() {
        return occupied;
    }

    public void setOccupied(Boolean occupied) {
        this.occupied = occupied;
    }
}