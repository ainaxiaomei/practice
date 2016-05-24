package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.IndexDbMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class IndexDbDao implements IIndexDbDao{
	@Autowired
	private IndexDbMapperExt indexDbMapperExt;

	@Override
	public int addIndexDb(IndexDb indexDb) {
		return indexDbMapperExt.insertSelective(indexDb);
	}

	@Override
	public int deleteIndexDb(int serverId) {
		return indexDbMapperExt.deleteByPrimaryKey(serverId);
	}

	@Override
	public int modifyIndexDb(IndexDb indexDb) {
		return indexDbMapperExt.updateByPrimaryKeySelective(indexDb);
	}

	@Override
	public List<IndexDb> getIndexDb(IndexDb indexDb, int start, int end) {
		return indexDbMapperExt.selectByCondition(indexDb, start, end);
	}

	
	
	
}
