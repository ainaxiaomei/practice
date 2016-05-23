package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.IndexDb;

public interface IndexDbMapper {
    int deleteByPrimaryKey(Integer serverId);

    int insert(IndexDb record);

    int insertSelective(IndexDb record);

    IndexDb selectByPrimaryKey(Integer serverId);

    int updateByPrimaryKeySelective(IndexDb record);

    int updateByPrimaryKey(IndexDb record);
}