package com.snail.audio.admin.entity;

public class Device {
    private String devtype;

    private String audioParams;

    private String datatype;

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

    public String getDatatype() {
        return datatype;
    }

    public void setDatatype(String datatype) {
        this.datatype = datatype;
    }
}