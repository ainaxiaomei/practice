package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.GroupAudioServers;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.GroupAudioServersMapperExt;
import com.snail.audio.admin.mapper.GroupMcuServersMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class GroupAudioServerDao implements IGroupAudioServerDao{
	@Autowired
	private GroupAudioServersMapperExt groupAudioServerMapperExt;

	@Override
	public int addGroupAudioServer(GroupAudioServers groupAudioServer) {
		return groupAudioServerMapperExt.insertSelective(groupAudioServer);
	}

	@Override
	public int deleteGroupAudioServer(int id) {
		return groupAudioServerMapperExt.deleteByPrimaryKey(id);
	}

	@Override
	public int modifyGroupAudioServer(GroupAudioServers groupAudioServer) {
		return groupAudioServerMapperExt.updateByPrimaryKeySelective(groupAudioServer);
	}

	@Override
	public List<GroupAudioServers> getAudio(GroupAudioServers groupAudioServer, int start, int end) {
		return groupAudioServerMapperExt.selectByCondition(groupAudioServer, start, end);
	}

	@Override
	public int deleteByGroupId(int groupId) {
		return groupAudioServerMapperExt.deleteByGroupId(groupId);
	}

	@Override
	public int deleteByServerId(int serverId) {
		return groupAudioServerMapperExt.deleteByServerId(serverId);
	}

	@Override
	public List<GroupAudioServers> getAudioServerId(int serverId) {
		return groupAudioServerMapperExt.getAudioServerId(serverId);
	}

	@Override
	public List<GroupAudioServers> getchildren(int serverId) {
		return groupAudioServerMapperExt.getChildrenByServerId(serverId);
	}

	
	
	
	
}
