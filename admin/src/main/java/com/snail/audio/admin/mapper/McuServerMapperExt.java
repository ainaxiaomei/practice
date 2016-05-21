package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.McuServer;
@Resource
public interface McuServerMapperExt extends McuServerMapper{
	public List<McuServer> selectByCondition(@Param("mcu")McuServer mcu,@Param("start")int start,@Param("end")int end);
    
}