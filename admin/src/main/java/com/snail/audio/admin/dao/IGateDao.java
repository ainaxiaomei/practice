package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.IndexGate;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IGateDao {
	public int addGate(IndexGate gate);
	public int deleteGate(int serverId);
	public int modifyGate(IndexGate gate);
	public List<IndexGate> getGateServer(IndexGate gate,int start,int end);
}
