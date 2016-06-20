package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.App;

@Resource
public interface AppMapperExt extends AppMapper {
	//��ѯ����Ӧ����Ϣ
	//public List<App> getApplications(int start,int end);
	public List<App> selectByCondition(@Param("app")App app,@Param("start")int start,@Param("end")int pageSize);
	public List<App> selectApp(@Param("app")App app,@Param("appids")String[] appids,@Param("start")int start,@Param("end")int pageSize);
	//更新app表
	public int updateByPrimaryKeySelective(App app);
	//查询最大beginUid
	public String selectMaxEndUid();
	//跟新appids的状态
	public int setAppOccupied(@Param("state")boolean state,@Param("appids")String[] appids);
}
