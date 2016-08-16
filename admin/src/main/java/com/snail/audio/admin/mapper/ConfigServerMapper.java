package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.ConfigServer;

public interface ConfigServerMapper {
    int deleteByPrimaryKey(Integer serverId);

    int insert(ConfigServer record);

    int insertSelective(ConfigServer record);

    ConfigServer selectByPrimaryKey(Integer serverId);

    int updateByPrimaryKeySelective(ConfigServer record);

    int updateByPrimaryKey(ConfigServer record);
}