package com.snail.audio.admin.entity;

public class IndexGate {
    private Integer serverId;

    private String serverName;

    private String svcUrl;

    private String httpUrl;

    private Integer dspnum;

    private Boolean valid;

    public Integer getServerId() {
        return serverId;
    }

    public void setServerId(Integer serverId) {
        this.serverId = serverId;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName == null ? null : serverName.trim();
    }

    public String getSvcUrl() {
        return svcUrl;
    }

    public void setSvcUrl(String svcUrl) {
        this.svcUrl = svcUrl == null ? null : svcUrl.trim();
    }

    public String getHttpUrl() {
        return httpUrl;
    }

    public void setHttpUrl(String httpUrl) {
        this.httpUrl = httpUrl == null ? null : httpUrl.trim();
    }

    public Integer getDspnum() {
        return dspnum;
    }

    public void setDspnum(Integer dspnum) {
        this.dspnum = dspnum;
    }

    public Boolean getValid() {
        return valid;
    }

    public void setValid(Boolean valid) {
        this.valid = valid;
    }
}