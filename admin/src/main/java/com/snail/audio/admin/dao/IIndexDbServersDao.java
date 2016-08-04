package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.IndexDBServer;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IIndexDbServersDao {
	public int addIndexDb(IndexDBServer indexDb);
	public int deleteIndexDb(int serverId);
	public int modifyIndexDb(IndexDBServer indexDb);
	public List<IndexDBServer> getIndexDb(IndexDBServer indexDb,int start,int end);
	public List<IndexDBServer> selectIndexDb(IndexDBServer indexDb,int start,int end);
}
