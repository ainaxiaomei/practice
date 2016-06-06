package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.Dictionary;
import com.snail.audio.admin.entity.McuServer;
@Resource
public interface DictionaryMapperExt extends DictionaryMapper {
   public List<Dictionary> selectByCondition(@Param("dict")Dictionary mcu,@Param("start")int start,@Param("end")int end);
}
