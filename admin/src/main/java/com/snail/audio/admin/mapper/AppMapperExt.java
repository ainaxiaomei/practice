package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import com.snail.audio.admin.entity.App;

@Resource
public interface AppMapperExt extends AppMapper {
	//��ѯ����Ӧ����Ϣ
	public List<App> getApplications(int start,int end);
	//更新app表
	public int updateByPrimaryKeySelective(App app);
}
