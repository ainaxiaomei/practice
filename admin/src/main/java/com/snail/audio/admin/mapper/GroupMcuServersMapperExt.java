package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.GroupMcuServers;
import com.snail.audio.admin.entity.McuServer;
@Resource
public interface GroupMcuServersMapperExt extends  GroupMcuServersMapper{
	public List<GroupMcuServers> selectByCondition(@Param("groupMcuServer")GroupMcuServers groupMcuServer,@Param("start")int start,@Param("end")int end);

}