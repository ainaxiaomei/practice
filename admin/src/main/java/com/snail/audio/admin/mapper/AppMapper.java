package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.App;

public interface AppMapper {
    int deleteByPrimaryKey(Integer appid);

    int insert(App record);

    int insertSelective(App record);

    App selectByPrimaryKey(Integer appid);

    int updateByPrimaryKeySelective(App record);

    int updateByPrimaryKey(App record);
}