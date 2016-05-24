package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.IndexDb;
@Resource
public interface IndexDbMapperExt extends IndexDbMapper{
	public List<IndexDb> selectByCondition(@Param("indexDb")IndexDb indexDb,@Param("start")int start,@Param("end")int end);
}