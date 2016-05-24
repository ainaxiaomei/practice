package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.GroupMcuServers;

public interface GroupMcuServersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupMcuServers record);

    int insertSelective(GroupMcuServers record);

    GroupMcuServers selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupMcuServers record);

    int updateByPrimaryKey(GroupMcuServers record);
}