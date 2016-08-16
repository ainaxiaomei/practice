package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.ConfigServer;
import com.snail.audio.admin.entity.IndexGate;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IConfigDao {
	public int addConfigServer(ConfigServer configServer);
	public int deleteConfigServer(int serverId);
	public int modifyConfigServer(ConfigServer configServer);
	public List<ConfigServer> getConfigServer(ConfigServer configServer,int start,int end);
}
