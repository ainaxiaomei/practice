package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.GroupAudio;
import com.snail.audio.admin.entity.GroupMcu;
@Resource
public interface GroupAudioMapperExt extends  GroupAudioMapper{
	public List<GroupAudio> selectByCondition(@Param("groupAudio")GroupAudio groupMcu,@Param("start")int start,@Param("end")int end);

}