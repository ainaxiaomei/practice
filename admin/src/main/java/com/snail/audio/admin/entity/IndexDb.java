package com.snail.audio.admin.entity;

public class IndexDb {
    private Integer serverId;

    private String svcUrl;

    private String httpUrl;

    private Boolean valid;

    private String appids;

    private Integer roomidMin;

    private Integer roomidMax;

    private Integer dspnum;

    private String serverName;

    public Integer getServerId() {
        return serverId;
    }

    public void setServerId(Integer serverId) {
        this.serverId = serverId;
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

    public Boolean getValid() {
        return valid;
    }

    public void setValid(Boolean valid) {
        this.valid = valid;
    }

    public String getAppids() {
        return appids;
    }

    public void setAppids(String appids) {
        this.appids = appids == null ? null : appids.trim();
    }

    public Integer getRoomidMin() {
        return roomidMin;
    }

    public void setRoomidMin(Integer roomidMin) {
        this.roomidMin = roomidMin;
    }

    public Integer getRoomidMax() {
        return roomidMax;
    }

    public void setRoomidMax(Integer roomidMax) {
        this.roomidMax = roomidMax;
    }

    public Integer getDspnum() {
        return dspnum;
    }

    public void setDspnum(Integer dspnum) {
        this.dspnum = dspnum;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName == null ? null : serverName.trim();
    }
}