package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.GroupMcuServers;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IGroupMcuServerDao {
	public int addGroupMcuServer(GroupMcuServers  groupMcuServer);
	public int deleteGroupMcuServer(int id);
	public int modifyGroupMcuServer(GroupMcuServers groupMcuServer);
	public List<GroupMcuServers> getMCU(GroupMcuServers groupMcuServer,int start,int end);
	public int deleteGroupMCUByGroupId(int groupId);
	public int deleteGroupMCUByServerId(int serverId);
	public List<GroupMcuServers> getServerId(int serverId);
}
