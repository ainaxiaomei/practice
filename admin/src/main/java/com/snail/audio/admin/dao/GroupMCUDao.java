package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.GroupMcu;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.GroupMcuMapperExt;
import com.snail.audio.admin.mapper.GroupMcuServersMapper;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class GroupMCUDao implements IGroupMCUDao{
	@Autowired
	private GroupMcuMapperExt  groupMcuServerMapperExt;

	@Override
	public int addGroupMCU(GroupMcu groupMcu) {
		return groupMcuServerMapperExt.insertSelective(groupMcu);
	}

	@Override
	public int deleteGroupMCU(int groupId) {
		return groupMcuServerMapperExt.deleteByPrimaryKey(groupId);
	}

	@Override
	public int modifyGroupMCU(GroupMcu groupMcu) {
		return groupMcuServerMapperExt.updateByPrimaryKeySelective(groupMcu);
	}

	@Override
	public List<GroupMcu> getGroupMCU(GroupMcu groupMcu, int start, int pageSize) {
		return groupMcuServerMapperExt.selectByCondition(groupMcu, start, pageSize);
	}

	
	
	
	
}
