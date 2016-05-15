package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import com.snail.audio.admin.entity.App;

@Resource
public interface AppMapperExt extends AppMapper {
	//查询所有应用信息
	public List<App> getApplications(int start,int end);
}
