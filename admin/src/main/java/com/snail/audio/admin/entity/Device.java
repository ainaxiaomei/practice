package com.snail.audio.admin.entity;

public class Device {
    private String devtype;

    private String audioParams;

    public String getDevtype() {
        return devtype;
    }

    public void setDevtype(String devtype) {
        this.devtype = devtype == null ? null : devtype.trim();
    }

    public String getAudioParams() {
        return audioParams;
    }

    public void setAudioParams(String audioParams) {
        this.audioParams = audioParams == null ? null : audioParams.trim();
    }
}