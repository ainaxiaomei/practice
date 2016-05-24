package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.GroupAudioServers;

public interface GroupAudioServersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GroupAudioServers record);

    int insertSelective(GroupAudioServers record);

    GroupAudioServers selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GroupAudioServers record);

    int updateByPrimaryKey(GroupAudioServers record);
}