package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.GroupAudioServers;
import com.snail.audio.admin.entity.GroupMcuServers;
import com.snail.audio.admin.entity.McuServer;
@Resource
public interface GroupAudioServersMapperExt extends  GroupAudioServersMapper{
	public List<GroupAudioServers> selectByCondition(@Param("groupAudioServer")GroupAudioServers groupMcuServer,@Param("start")int start,@Param("end")int end);
    public int deleteByGroupId(int groupId);
    public int deleteByServerId(int serverId);
    public List<GroupAudioServers> getAudioServerId(int serverId);
    public List<GroupAudioServers> getChildrenByServerId(int serverId);
}