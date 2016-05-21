package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.mapper.AppMapperExt;
import com.snail.audio.admin.mapper.AudioServerMapperExt;
import com.snail.audio.admin.mapper.McuServerMapperExt;
@Repository
public class AudioDao implements IAudioDao{
	@Autowired
	private AudioServerMapperExt audioServerMapperExt;

	@Override
	public List<AudioServer> getAudioServer(AudioServer audio, int start, int end) {
		return audioServerMapperExt.selectByCondition(audio, start, end);
	}


	
	
}
