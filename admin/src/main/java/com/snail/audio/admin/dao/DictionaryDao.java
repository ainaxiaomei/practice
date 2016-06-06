package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.Dictionary;
import com.snail.audio.admin.mapper.AppMapper;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.DictionaryMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class DictionaryDao implements IDictionaryDao{
	@Autowired
	private DictionaryMapperExt DictionaryMapperExt;

	@Override
	public int addDictionary(Dictionary dict) {
		return DictionaryMapperExt.insertSelective(dict);
	}

	@Override
	public int deleteDictionary(String serverId) {
		return DictionaryMapperExt.deleteByPrimaryKey(serverId);
	}

	@Override
	public int modifyDictionary(Dictionary dict) {
		return DictionaryMapperExt.updateByPrimaryKeySelective(dict);
	}

	@Override
	public List<Dictionary> getDictionary(Dictionary dict,int start,int end) {
		return DictionaryMapperExt.selectByCondition(dict,start, end);
	}
	
	
	
}
