package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.AppResource;

public interface AppResourceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppResource record);

    int insertSelective(AppResource record);

    AppResource selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppResource record);

    int updateByPrimaryKey(AppResource record);
}