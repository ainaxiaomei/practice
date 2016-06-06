package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.Device;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.DeviceMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class DeviceDao implements IDeviceDao{
	@Autowired
	private DeviceMapperExt deviceMapperExt;

	@Override
	public int addDevice(Device mcu) {
		return deviceMapperExt.insertSelective(mcu);
	}

	@Override
	public int deleteDevice(String type) {
		return deviceMapperExt.deleteByPrimaryKey(type);
	}

	@Override
	public int modifyDevice(Device mcu) {
		return deviceMapperExt.updateByPrimaryKeySelective(mcu);
	}

	@Override
	public List<Device> getDevice(Device mcu,int start,int end) {
		return deviceMapperExt.selectByCondition(mcu,start, end);
	}
	
	
	
}
