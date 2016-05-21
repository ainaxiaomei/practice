package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import com.snail.audio.admin.entity.McuServer;
@Resource
public interface McuServerMapperExt extends McuServerMapper{
	public List<McuServer> selectByCondition(McuServer mcu);
    
}