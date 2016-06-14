package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.AppResource;
@Resource
public interface AppResourceMapperExt extends AppResourceMapper{
    public List<AppResource> selectByCondition(@Param("appResource")AppResource appResource,@Param("start")int start,@Param("end")int end);
    public int deleteByAppId(int appId);
}