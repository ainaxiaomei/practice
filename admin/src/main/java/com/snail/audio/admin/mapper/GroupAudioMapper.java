package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.GroupAudio;

public interface GroupAudioMapper {
    int deleteByPrimaryKey(Integer groupId);

    int insert(GroupAudio record);

    int insertSelective(GroupAudio record);

    GroupAudio selectByPrimaryKey(Integer groupId);

    int updateByPrimaryKeySelective(GroupAudio record);

    int updateByPrimaryKey(GroupAudio record);
}