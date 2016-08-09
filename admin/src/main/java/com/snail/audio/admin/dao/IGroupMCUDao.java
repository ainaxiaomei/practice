package com.snail.audio.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.GroupAudio;
import com.snail.audio.admin.entity.GroupMcu;
@Repository
public interface IGroupMCUDao {
	public int addGroupMCU(GroupMcu groupMcu);
	public int deleteGroupMCU(int groupId);
	public int modifyGroupMCU(GroupMcu groupMcu);
	public List<GroupMcu> getGroupMCU(GroupMcu groupMcu,int start,int pageSize);
	public List<GroupMcu> getMessages(GroupMcu groupMcu,int start,int end);
	
}
