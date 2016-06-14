package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.mapper.AppResourceMapperExt;
@Repository
public class AppResourceDao implements IAppResourceDao {
	@Autowired
    private AppResourceMapperExt appResourceMapperExt;
	@Override
	public List<AppResource> getAppResource(AppResource appResource, int start, int end) {
		return appResourceMapperExt.selectByCondition(appResource, start, end);
	}
	@Override
	public int saveAppRes(AppResource appRes) {
		return appResourceMapperExt.insertSelective(appRes);
	}
	@Override
	public int modifyAppRes(AppResource appRes) {
		return appResourceMapperExt.updateByPrimaryKeySelective(appRes);
	}
	@Override
	public int deleteAppRes(int id) {
		return appResourceMapperExt.deleteByPrimaryKey(id);
	}
	@Override
	public int deleteByAppId(int appId) {
		return appResourceMapperExt.deleteByAppId(appId);
	}


}
