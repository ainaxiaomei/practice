package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.snail.audio.admin.entity.ConfigServer;
@Resource
public interface ConfigServerMapperExt extends ConfigServerMapper{
	// 条件查询
	public List<ConfigServer> selectByCondition(@Param("config") ConfigServer configServer, @Param("start") int start,
			@Param("end") int end);

}