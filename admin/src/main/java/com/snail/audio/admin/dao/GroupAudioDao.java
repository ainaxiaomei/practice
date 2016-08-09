package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.GroupAudio;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.GroupAudioMapperExt;
import com.snail.audio.admin.mapper.GroupMcuMapperExt;
import com.snail.audio.admin.mapper.GroupMcuServersMapper;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class GroupAudioDao implements IGroupAudioDao{
	@Autowired
	private GroupAudioMapperExt  groupAudioMapperExt;

	@Override
	public int addGroupAudio(GroupAudio groupMcu) {
		return groupAudioMapperExt.insertSelective(groupMcu);
	}

	@Override
	public int deleteGroupAudio(int groupId) {
		return groupAudioMapperExt.deleteByPrimaryKey(groupId);
	}

	@Override
	public int modifyGroupAudio(GroupAudio groupMcu) {
		return groupAudioMapperExt.updateByPrimaryKeySelective(groupMcu);
	}

	@Override
	public List<GroupAudio> getGroupAudio(GroupAudio groupMcu, int start, int pageSize) {
		return groupAudioMapperExt.selectByCondition(groupMcu, start, pageSize);
	}

	@Override
	public List<GroupAudio> getMessage(GroupAudio groupMcu, int start, int end) {
		return groupAudioMapperExt.getMessage(groupMcu, start, end);
	}

	
	
	
	
}
