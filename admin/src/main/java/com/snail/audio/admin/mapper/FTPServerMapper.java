package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.FTPServer;

public interface FTPServerMapper {
    int deleteByPrimaryKey(Integer serverId);

    int insert(FTPServer record);

    int insertSelective(FTPServer record);

    FTPServer selectByPrimaryKey(Integer serverId);

    int updateByPrimaryKeySelective(FTPServer record);

    int updateByPrimaryKey(FTPServer record);
}