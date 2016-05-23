package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.IndexGate;
@Resource
public interface IndexGateMapperExt extends IndexGateMapper{
	public List<IndexGate> selectByCondition(@Param("gate")IndexGate gate,@Param("start")int start,@Param("end")int end);

}