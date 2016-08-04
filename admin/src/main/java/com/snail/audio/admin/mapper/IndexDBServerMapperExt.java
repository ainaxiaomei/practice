package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.IndexDBServer;
import com.snail.audio.admin.entity.IndexDb;
@Resource
public interface IndexDBServerMapperExt extends IndexDBServerMapper {
	public List<IndexDBServer> selectByCondition(@Param("db")IndexDBServer indexDb,@Param("start")int start,@Param("end")int end);
	public List<IndexDBServer> selectIndexDb(@Param("db")IndexDBServer indexDb,@Param("start")int start,@Param("end")int end);
}