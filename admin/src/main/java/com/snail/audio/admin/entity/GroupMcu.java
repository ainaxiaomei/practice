package com.snail.audio.admin.entity;

public class GroupMcu {
    private Integer groupId;

    private Integer curUsernum;

    private Integer maxUsernum;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getCurUsernum() {
        return curUsernum;
    }

    public void setCurUsernum(Integer curUsernum) {
        this.curUsernum = curUsernum;
    }

    public Integer getMaxUsernum() {
        return maxUsernum;
    }

    public void setMaxUsernum(Integer maxUsernum) {
        this.maxUsernum = maxUsernum;
    }
}