package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.IndexDBServer;

public interface IndexDBServerMapper {
    int deleteByPrimaryKey(Integer serverId);

    int insert(IndexDBServer record);

    int insertSelective(IndexDBServer record);

    IndexDBServer selectByPrimaryKey(Integer serverId);

    int updateByPrimaryKeySelective(IndexDBServer record);

    int updateByPrimaryKey(IndexDBServer record);
}