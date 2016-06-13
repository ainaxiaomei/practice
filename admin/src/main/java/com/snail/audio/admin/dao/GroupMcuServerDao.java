package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.GroupMcuServers;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.GroupMcuServersMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class GroupMcuServerDao implements IGroupMcuServerDao{
	@Autowired
	private GroupMcuServersMapperExt groupMcuServerMapperExt;

	@Override
	public int addGroupMcuServer(GroupMcuServers groupMcuServer) {
		return groupMcuServerMapperExt.insertSelective(groupMcuServer);
	}

	@Override
	public int deleteGroupMcuServer(int id) {
		return groupMcuServerMapperExt.deleteByPrimaryKey(id);
	}

	@Override
	public int modifyGroupMcuServer(GroupMcuServers groupMcuServer) {
		return groupMcuServerMapperExt.updateByPrimaryKeySelective(groupMcuServer);
	}

	@Override
	public List<GroupMcuServers> getMCU(GroupMcuServers groupMcuServer, int start, int end) {
		return groupMcuServerMapperExt.selectByCondition(groupMcuServer, start, end);
	}

	@Override
	public int deleteGroupMCUByGroupId(int groupId) {
		return groupMcuServerMapperExt.deleteByGroupId(groupId);
	}

	@Override
	public int deleteGroupMCUByServerId(int serverId) {
		return groupMcuServerMapperExt.deleteByServerId(serverId);
	}

	@Override
	public List<GroupMcuServers> getServerId(int serverId) {
		return groupMcuServerMapperExt.getServerId(serverId);
		
	}

	
	
	
	
}
