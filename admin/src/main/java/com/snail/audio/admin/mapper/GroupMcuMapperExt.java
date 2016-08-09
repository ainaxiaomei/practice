package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.GroupMcu;
@Resource
public interface GroupMcuMapperExt extends GroupMcuMapper {
	public List<GroupMcu> selectByCondition(@Param("groupMcu")GroupMcu groupMcu,@Param("start")int start,@Param("end")int end);
	public List<GroupMcu> getMessages(@Param("groupMcu")GroupMcu groupMcu,@Param("start")int start,@Param("end")int end);
	

}