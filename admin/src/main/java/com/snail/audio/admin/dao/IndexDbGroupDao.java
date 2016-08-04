package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.IndexDBGroup;
import com.snail.audio.admin.entity.IndexDBServer;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.IndexDBGroupMapperExt;
import com.snail.audio.admin.mapper.IndexDBServerMapperExt;
import com.snail.audio.admin.mapper.IndexDbMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class IndexDbGroupDao implements IIndexDbGroupDao{
	@Autowired
	private IndexDBGroupMapperExt indexDBGroupMapperExt;
	@Override
	public int addIndexDbGroup(IndexDBGroup indexDbGroup) {
		return indexDBGroupMapperExt.insertSelective(indexDbGroup);
	}

	@Override
	public int deleteIndexDbGroup(int groupId) {
		return indexDBGroupMapperExt.deleteByPrimaryKey(groupId);
	}

	@Override
	public int modifyIndexDbGroup(IndexDBGroup indexDbGroup) {
		return indexDBGroupMapperExt.updateByPrimaryKeySelective(indexDbGroup);
	}

	@Override
	public List<IndexDBGroup> getIndexDbGroup(IndexDBGroup indexDbGroup, int start, int end) {
		return indexDBGroupMapperExt.selectByCondition(indexDbGroup, start, end);
	}

	
	
	
}
