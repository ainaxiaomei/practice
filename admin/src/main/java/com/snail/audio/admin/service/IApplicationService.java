package com.snail.audio.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snail.audio.admin.entity.App;
@Service
public interface IApplicationService {
	 //查询所有应用
     public List<App> getApplication(int start,int end);
     //修改应用信息
     public int ModifyApplication(App app);
     //删除应用
     public int deleteApplication(App app);
}
