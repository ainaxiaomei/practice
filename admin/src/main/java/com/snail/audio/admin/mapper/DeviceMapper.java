package com.snail.audio.admin.mapper;

import com.snail.audio.admin.entity.Device;

public interface DeviceMapper {
    int deleteByPrimaryKey(String devtype);

    int insert(Device record);

    int insertSelective(Device record);

    Device selectByPrimaryKey(String devtype);

    int updateByPrimaryKeySelective(Device record);

    int updateByPrimaryKey(Device record);
}