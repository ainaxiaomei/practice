package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.IndexDBGroup;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IIndexDbGroupDao {
	public int addIndexDbGroup(IndexDBGroup indexDbGroup);
	public int deleteIndexDbGroup(int groupId);
	public int modifyIndexDbGroup(IndexDBGroup indexDbGroup);
	public List<IndexDBGroup> getIndexDbGroup(IndexDBGroup indexDbGroup,int start,int end);
}
