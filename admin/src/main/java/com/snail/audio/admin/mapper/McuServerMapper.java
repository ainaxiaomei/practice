package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.McuServer;

public interface McuServerMapper {
    int deleteByPrimaryKey(Integer serverId);

    int insert(McuServer record);

    int insertSelective(McuServer record);

    McuServer selectByPrimaryKey(Integer serverId);

    int updateByPrimaryKeySelective(McuServer record);

    int updateByPrimaryKey(McuServer record);
}