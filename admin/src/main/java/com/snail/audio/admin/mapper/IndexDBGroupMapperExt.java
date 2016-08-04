package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.IndexDBGroup;
@Resource
public interface IndexDBGroupMapperExt extends IndexDBGroupMapper{
	public List<IndexDBGroup> selectByCondition(@Param("dbGroup")IndexDBGroup indexDbGrp,@Param("start")int start,@Param("end")int end);

}