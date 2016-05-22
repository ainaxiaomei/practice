package com.snail.audio.admin.entity;

public class AppResource {
    private Integer id;

    private Integer appid;

    private Integer roomid;

    private Integer gpLeftId;

    private Integer gpRightId;

    private Integer gpType;

    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAppid() {
        return appid;
    }

    public void setAppid(Integer appid) {
        this.appid = appid;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getGpLeftId() {
        return gpLeftId;
    }

    public void setGpLeftId(Integer gpLeftId) {
        this.gpLeftId = gpLeftId;
    }

    public Integer getGpRightId() {
        return gpRightId;
    }

    public void setGpRightId(Integer gpRightId) {
        this.gpRightId = gpRightId;
    }

    public Integer getGpType() {
        return gpType;
    }

    public void setGpType(Integer gpType) {
        this.gpType = gpType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}