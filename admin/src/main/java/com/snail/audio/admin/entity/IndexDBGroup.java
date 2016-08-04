package com.snail.audio.admin.entity;

public class IndexDBGroup {
    private Integer groupId;

    private Boolean valid;

    private String appids;

    private Integer roomidMin;

    private Integer roomidMax;

    private String description;

    private Integer serverid1;

    private Integer serverid2;

    private Integer mainServerid;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getServerid1() {
        return serverid1;
    }

    public void setServerid1(Integer serverid1) {
        this.serverid1 = serverid1;
    }

    public Integer getServerid2() {
        return serverid2;
    }

    public void setServerid2(Integer serverid2) {
        this.serverid2 = serverid2;
    }

    public Integer getMainServerid() {
        return mainServerid;
    }

    public void setMainServerid(Integer mainServerid) {
        this.mainServerid = mainServerid;
    }
}