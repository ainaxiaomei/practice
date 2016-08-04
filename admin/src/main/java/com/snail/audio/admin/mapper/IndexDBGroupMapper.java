package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.IndexDBGroup;

public interface IndexDBGroupMapper {
    int deleteByPrimaryKey(Integer groupId);

    int insert(IndexDBGroup record);

    int insertSelective(IndexDBGroup record);

    IndexDBGroup selectByPrimaryKey(Integer groupId);

    int updateByPrimaryKeySelective(IndexDBGroup record);

    int updateByPrimaryKey(IndexDBGroup record);
}