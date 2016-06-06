package com.snail.audio.admin.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.snail.audio.admin.entity.Device;
@Resource
public interface DeviceMapperExt extends DeviceMapper{
	public List<Device> selectByCondition(@Param("device")Device device,@Param("start")int start,@Param("end")int end);

}