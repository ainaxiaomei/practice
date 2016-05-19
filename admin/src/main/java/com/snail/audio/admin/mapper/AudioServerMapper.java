package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.AudioServer;

public interface AudioServerMapper {
    int deleteByPrimaryKey(Integer serverId);

    int insert(AudioServer record);

    int insertSelective(AudioServer record);

    AudioServer selectByPrimaryKey(Integer serverId);

    int updateByPrimaryKeySelective(AudioServer record);

    int updateByPrimaryKey(AudioServer record);
}