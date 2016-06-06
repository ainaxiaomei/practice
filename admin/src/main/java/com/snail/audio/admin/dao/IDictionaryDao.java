package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.Dictionary;
@Repository
public interface IDictionaryDao {
	public int addDictionary(Dictionary dict);
	public int deleteDictionary(String key);
	public int modifyDictionary(Dictionary dict);
	public List<Dictionary> getDictionary(Dictionary dict,int start,int end);
}
