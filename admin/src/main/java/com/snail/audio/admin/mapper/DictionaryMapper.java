package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.Dictionary;

public interface DictionaryMapper {
    int deleteByPrimaryKey(String key);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    Dictionary selectByPrimaryKey(String key);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);
}