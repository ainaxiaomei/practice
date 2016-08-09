package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.GroupAudio;
import com.snail.audio.admin.entity.GroupMcu;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.GroupMcuMapperExt;
import com.snail.audio.admin.mapper.GroupMcuServersMapper;
import com.snail.audio.admin.mapper.GroupMcuServersMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class GroupMCUDao implements IGroupMCUDao{
	@Autowired
	private GroupMcuMapperExt  groupMcuMapperExt;
	@Override
	public int addGroupMCU(GroupMcu groupMcu) {
		return groupMcuMapperExt.insertSelective(groupMcu);
	}

	@Override
	public int deleteGroupMCU(int groupId) {
		return groupMcuMapperExt.deleteByPrimaryKey(groupId);
	}

	@Override
	public int modifyGroupMCU(GroupMcu groupMcu) {
		return groupMcuMapperExt.updateByPrimaryKeySelective(groupMcu);
	}

	@Override
	public List<GroupMcu> getGroupMCU(GroupMcu groupMcu, int start, int pageSize) {
		return groupMcuMapperExt.selectByCondition(groupMcu, start, pageSize);
	}

	@Override
	public List<GroupMcu> getMessages(GroupMcu groupMcu, int start, int end) {
		return groupMcuMapperExt.getMessages(groupMcu, start, end);
	}


	
	
	
	
}
