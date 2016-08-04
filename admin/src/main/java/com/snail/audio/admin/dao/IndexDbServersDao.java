package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.IndexDBServer;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.IndexDBServerMapperExt;
import com.snail.audio.admin.mapper.IndexDbMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class IndexDbServersDao implements IIndexDbServersDao{
	@Autowired
	private IndexDBServerMapperExt indexDBServerMapperExt;

	@Override
	public int addIndexDb(IndexDBServer indexDb) {
		return indexDBServerMapperExt.insertSelective(indexDb);
	}

	@Override
	public int deleteIndexDb(int serverId) {
		return indexDBServerMapperExt.deleteByPrimaryKey(serverId);
	}

	@Override
	public int modifyIndexDb(IndexDBServer indexDb) {
		return indexDBServerMapperExt.updateByPrimaryKeySelective(indexDb);
	}

	@Override
	public List<IndexDBServer> getIndexDb(IndexDBServer indexDb, int start, int end) {
		return indexDBServerMapperExt.selectByCondition(indexDb, start, end);
	}

	@Override
	public List<IndexDBServer> selectIndexDb(IndexDBServer indexDb, int start, int end) {
		return indexDBServerMapperExt.selectIndexDb(indexDb, start, end);
	}

	
	
	
}
