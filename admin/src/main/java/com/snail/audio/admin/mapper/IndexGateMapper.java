package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.IndexGate;

public interface IndexGateMapper {
    int deleteByPrimaryKey(Integer serverId);

    int insert(IndexGate record);

    int insertSelective(IndexGate record);

    IndexGate selectByPrimaryKey(Integer serverId);

    int updateByPrimaryKeySelective(IndexGate record);

    int updateByPrimaryKey(IndexGate record);
}