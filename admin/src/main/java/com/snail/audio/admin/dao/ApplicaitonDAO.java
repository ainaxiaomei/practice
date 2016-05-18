package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.mapper.AppMapperExt;
@Repository
public class ApplicaitonDAO implements IApplicationDao{
	@Autowired
	private AppMapperExt appMapperExt;
	public List<App> getApplicationt(int start, int end) {
		List<App> result=appMapperExt.getApplications(start,end);
		return result;
	}
	@Override
	public int ModityApplication(App app) {
		return appMapperExt.updateByPrimaryKeySelective(app);
	}
	@Override
	public int deleteApplication(int appId) {
		return appMapperExt.deleteByPrimaryKey(appId);
	}
	
}
