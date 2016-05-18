package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
@Repository
public interface IApplicationDao {
	public List<App> getApplicationt(int start,int end);
    public int ModityApplication(App app);
    public int deleteApplication(int appId);
    public int addApplication(App app);
}
