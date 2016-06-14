package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IAppResourceDao {
	public List<AppResource> getAppResource(AppResource appResource,int start,int end);
	public int saveAppRes(AppResource appRes);
	public int modifyAppRes(AppResource appRes);
	public int deleteAppRes(int id);
	public int deleteByAppId(int id);
}
