package com.snail.audio.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.GroupAudio;
@Repository
public interface IGroupAudioDao {
	public int addGroupAudio(GroupAudio groupAudio);
	public int deleteGroupAudio(int groupId);
	public int modifyGroupAudio(GroupAudio groupAudio);
	public List<GroupAudio> getGroupAudio(GroupAudio groupAudio,int start,int pageSize);
	public List<GroupAudio> getMessage(GroupAudio groupMcu,int start,int end);
}
