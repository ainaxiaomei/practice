package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IIndexDbDao {
	public int addIndexDb(IndexDb indexDb);
	public int deleteIndexDb(int serverId);
	public int modifyIndexDb(IndexDb indexDb);
	public List<IndexDb> getIndexDb(IndexDb indexDb,int start,int end);
}
