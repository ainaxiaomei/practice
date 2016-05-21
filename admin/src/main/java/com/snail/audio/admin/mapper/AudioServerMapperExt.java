package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.AudioServer;
@Resource
public interface AudioServerMapperExt extends AudioServerMapper{
    public List<AudioServer> selectByCondition(@Param("audio")AudioServer audio,@Param("start")int start,@Param("end")int end);
    
}