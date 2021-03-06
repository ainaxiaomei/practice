package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.Company;
@Repository
public interface IApplicationDao {
	public List<App> getApplicationt(App app,int start,int end);
	public List<App> selectApp(App app,String[] appids,int start,int end);
    public int ModityApplication(App app);
    public int deleteApplication(int appId);
    public int addApplication(App app);
    public String getMaxEndUid();
    public int setAppOccupied(String ids,boolean state);
}
