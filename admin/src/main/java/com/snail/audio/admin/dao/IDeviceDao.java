package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.Device;
@Repository
public interface IDeviceDao {
	public int addDevice(Device device);
	public int deleteDevice(String devtype);
	public int modifyDevice(Device device);
	public List<Device> getDevice(Device device,int start,int end);
}
