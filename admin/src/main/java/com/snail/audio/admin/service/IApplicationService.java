package com.snail.audio.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.GroupMcu;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.IndexGate;
import com.snail.audio.admin.entity.McuServer;
@Service
public interface IApplicationService {
	 //查询所有应用
     public List<App> getApplication(int start,int pageSize);
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
     //删除mcu
     public int deleteMcu(int id);
     //查询mcu
     public List<McuServer>getMCUServer(McuServer mcu,int start,int pageSize);
     //查询audio
     public List<AudioServer>getAudioServer(AudioServer audio,int start,int pageSize);
     //新增audio
     public int saveAudioServer(AudioServer audio);
     //修改audio
     public int modifyAudioServer(AudioServer audio);
     //删除audio
     public int deleteAudioServer(int serverId);
     //查询appResource
     public List<AppResource>getAppResource(AppResource appResource,int start,int pageSize);
     //新增appResource
     public int saveAppRes(AppResource appRes);
     //修改appResource
     public int modifyAppRes(AppResource appRes);
     //查询ftp
     public List<FTPServer>getFtpServer(FTPServer ftp,int start,int pageSize);
     //新增ftp
     public int saveFtp(FTPServer ftp);
     //修改ftp
     public int modifyFtp(FTPServer ftp);
     //删除gate
     public int deleteGateServer(int serverId);
     //新增gate
     public int saveGateServer(IndexGate gate);
     //修改gate
     public int modifyGate(IndexGate gate);
     //查询gate
     public List<IndexGate>getGateServer(IndexGate ftp,int start,int pageSize);
     //查询indexDb
     public List<IndexDb>getIndexDbServer(IndexDb indexdb,int start,int pageSize);
     //新增indexDb
     public int saveIndexDbServer(IndexDb indexdb);
     //修改indexDb
     public int modifyIndexDbServer(IndexDb indexdb);
     //删除indexDb
     public int deleteIndexDbServer(int serverId);
     //新增groupMcu
     public int saveGroupMcuServer(GroupMcu groupMcu);
     //修改groupMcu
     public int modifyGroupMcuServer(GroupMcu groupMcu);
     //删除groupMcu
     public int deleteGroupMcuServer(int groupId);
     //查询groupMcu
     public List<GroupMcu>getGroupMcu(GroupMcu groupMcu,int start,int pageSize);

}
