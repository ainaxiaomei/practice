package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.Company;
import com.snail.audio.admin.mapper.AppMapperExt;
@Repository
public class ApplicaitonDAO implements IApplicationDao{
	@Autowired
	private AppMapperExt appMapperExt;
	public List<App> getApplicationt(App app,int start, int end) {
		List<App> result=appMapperExt.selectByCondition(app,start,end);
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
	@Override
	public int addApplication(App app) {
		return appMapperExt.insert(app);
	}
	@Override
	public String getMaxEndUid() {
		return appMapperExt.selectMaxEndUid();
	}
	@Override
	public int setAppOccupied(String appids, boolean state) {
		String array[]=appids.split(",");
		return appMapperExt.setAppOccupied(state, array);
	}
	@Override
	public List<App> selectApp(App app, String[] appids, int start, int end) {
		return appMapperExt.selectApp(app, appids, start, end);
	}
	
}
