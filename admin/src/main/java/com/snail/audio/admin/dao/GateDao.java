package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.IndexGate;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.IndexGateMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class GateDao implements IGateDao{
	@Autowired
	private IndexGateMapperExt indexGateMapperExt;

	
	@Override
	public int deleteGate(int serverId) {
		return indexGateMapperExt.deleteByPrimaryKey(serverId);
	}

	
	@Override
	public List<IndexGate> getGateServer(IndexGate gate, int start, int end) {
		return indexGateMapperExt.selectByCondition(gate, start, end);
	}


	@Override
	public int addGate(IndexGate gate) {
		return indexGateMapperExt.insertSelective(gate);
	}


	@Override
	public int modifyGate(IndexGate gate) {
		return indexGateMapperExt.updateByPrimaryKeySelective(gate);
	}

	
	
}
