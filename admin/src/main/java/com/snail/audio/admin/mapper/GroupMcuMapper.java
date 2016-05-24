package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.GroupMcu;

public interface GroupMcuMapper {
    int deleteByPrimaryKey(Integer groupId);

    int insert(GroupMcu record);

    int insertSelective(GroupMcu record);

    GroupMcu selectByPrimaryKey(Integer groupId);

    int updateByPrimaryKeySelective(GroupMcu record);

    int updateByPrimaryKey(GroupMcu record);
}