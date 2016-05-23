package com.snail.audio.admin.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.McuServer;
@Repository
public interface IAudioDao {
	public List<AudioServer> getAudioServer(AudioServer audio,int start,int end);
	public int saveAudioServer(AudioServer audio);
	public int modifyAudioServer(AudioServer audio);
}
