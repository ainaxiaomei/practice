package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.GroupAudioServers;
@Repository
public interface IGroupAudioServerDao {
	public int addGroupAudioServer(GroupAudioServers  GroupAudioServers);
	public int deleteGroupAudioServer(int id);
	public int modifyGroupAudioServer(GroupAudioServers GroupAudioServers);
	public List<GroupAudioServers> getAudio(GroupAudioServers GroupAudioServers,int start,int end);
	public int deleteByGroupId(int groupId);
    public int deleteByServerId(int serverId);
    public List<GroupAudioServers> getAudioServerId(int serverId);
    public List<GroupAudioServers> getchildren(int serverId);
}
