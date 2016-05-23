package com.snail.audio.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.McuServer;
@Service
public interface IApplicationService {
	 //查询所有应用
     public List<App> getApplication(int start,int end);
     //修改应用信息
     public int ModifyApplication(App app);
     //删除应用
     public int deleteApplication(App app);
     //新增应用
     public int addApplication(App app);
     //新增mcu
     public int addMcu(McuServer mcu);
     //修改mcu
     public int modifyMcu(McuServer mcu);
     //查询mcu
     public List<McuServer>getMCUServer(McuServer mcu,int start,int end);
     //查询audio
     public List<AudioServer>getAudioServer(AudioServer audio,int start,int end);
     //新增audio
     public int saveAudioServer(AudioServer audio);
     //修改audio
     public int modifyAudioServer(AudioServer audio);
     //查询appResource
     public List<AppResource>getAppResource(AppResource appResource,int start,int end);
     //查询ftp
     public List<FTPServer>getFtpServer(FTPServer ftp,int start,int end);
     //新增ftp
     public int saveFtp(FTPServer ftp);
     //修改ftp
     public int modifyFtp(FTPServer ftp);

}
