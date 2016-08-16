package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.ConfigServer;
import com.snail.audio.admin.entity.IndexGate;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.ConfigServerMapperExt;
import com.snail.audio.admin.mapper.IndexGateMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class ConfigDao implements IConfigDao{
	@Autowired
	private  ConfigServerMapperExt configServerMapperExt;

	@Override
	public int addConfigServer(ConfigServer configServer) {
		return configServerMapperExt.insertSelective(configServer);
	}

	@Override
	public int deleteConfigServer(int serverId) {
		return configServerMapperExt.deleteByPrimaryKey(serverId);
	}

	@Override
	public int modifyConfigServer(ConfigServer configServer) {
		return configServerMapperExt.updateByPrimaryKeySelective(configServer);
	}

	@Override
	public List<ConfigServer> getConfigServer(ConfigServer configServer, int start, int end) {
		return configServerMapperExt.selectByCondition(configServer, start, end);
	}

	
	
	
}
