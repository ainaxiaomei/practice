package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.snail.audio.admin.entity.FTPServer;
@Resource
public interface FTPServerMapperExt extends FTPServerMapper {
    public List<FTPServer> selectByCondition(@Param("ftp")FTPServer ftpServer,@Param("start")int start,@Param("end")int end);
}