package com.snail.audio.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.Company;
import com.snail.audio.admin.entity.ConfigServer;
import com.snail.audio.admin.entity.Device;
import com.snail.audio.admin.entity.Dictionary;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.GroupAudio;
import com.snail.audio.admin.entity.GroupAudioServers;
import com.snail.audio.admin.entity.GroupMcu;
import com.snail.audio.admin.entity.GroupMcuServers;
import com.snail.audio.admin.entity.IndexDBGroup;
import com.snail.audio.admin.entity.IndexDBServer;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.IndexGate;
import com.snail.audio.admin.entity.McuServer;
@Service
public interface IApplicationService {
	 //查询所有应用
     public List<App> getApplication(App app,int start,int pageSize);
     //indexDb页面选择app
     public List<App> selectApp(App app,Integer serverId,int start,int pageSize);
     //修改应用信息
     public int ModifyApplication(App app);
     //删除应用
     public int deleteApplication(int  appId);
     //新增应用
     public int addApplication(App app);
     //新增mcu
     public int addMcu(McuServer mcu);
     //修改mcu
     public String modifyMcu(McuServer mcu);
     //删除mcu
     public int deleteMcu(int id)throws Exception;
     //查询mcu
     public List<McuServer>getMCUServer(McuServer mcu,int start,int pageSize);
     //查询audio
     public List<AudioServer>getAudioServer(AudioServer audio,int start,int pageSize);
     //新增audio
     public int saveAudioServer(AudioServer audio);
     //修改audio
     public String modifyAudioServer(AudioServer audio);
     //删除audio
     public int deleteAudioServer(int serverId);
     //查询appResource
     public List<AppResource>getAppResource(AppResource appResource,int start,int pageSize);
     //新增appResource
     public String saveAppRes(AppResource appRes);
     //修改appResource
     public String modifyAppRes(AppResource appRes);
     //删除appResource
     public String deleteAppRes(int id);
     //查询ftp
     public List<FTPServer>getFtpServer(FTPServer ftp,int start,int pageSize);
     //新增ftp
     public int saveFtp(FTPServer ftp);
     //修改ftp
     public int modifyFtp(FTPServer ftp);
     //删除ftp
     public int deleteFtp(int serverId);
     //删除gate
     public int deleteGateServer(int serverId);
     //新增gate
     public int saveGateServer(IndexGate gate);
     //修改gate
     public int modifyGate(IndexGate gate);
     //查询gate
     public List<IndexGate>getGateServer(IndexGate ftp,int start,int pageSize);
     //查询indexdbgroup
     public List<IndexDBGroup>getIndexDbGroup(IndexDBGroup dbGrp,int start,int pageSize);
     //新增indexdbgroup
     public int saveIndexDbGroup(IndexDBGroup dbGrp);
     //修改indexdbgroup
     public String modifyIndexDbGroup(IndexDBGroup dbGrp);
     //删除indexdbgroup
     public String deleteIndexDbGroup(int grpId);
     //选择indexDB
     public List<IndexDBServer> selectIndexDb(IndexDBServer indexDb,int start,int end);
     //查询indexDb
     public List<IndexDb>getIndexDbServer(IndexDb indexdb,int start,int pageSize);
     public List<IndexDBServer>getIndexDbServers(IndexDBServer indexdb,int start,int pageSize);
     //新增indexDb
     public int saveIndexDbServer(IndexDb indexdb);
     public int saveIndexDbServers(IndexDBServer indexdb);
     //修改indexDb
     public String modifyIndexDbServer(IndexDb indexdb);
     public String modifyIndexDbServers(IndexDBServer indexdb);
     //删除indexDb
     public String deleteIndexDbServer(int serverId);
     public String deleteIndexDbServers(int serverId);
     //新增groupMcu
     public String saveGroupMcu(GroupMcu groupMcu);
     //修改groupMcu
     public String modifyGroupMcu(GroupMcu groupMcu);
     //删除groupMcu
     public String deleteGroupMcu(int groupId);
     //查询groupMcu
     public List<GroupMcu>getGroupMcu(GroupMcu groupMcu,int start,int pageSize);
     //新增groupAudio
     public String saveGroupAudio(GroupAudio groupAudio);
     //修改groupAudio
     public String modifyGroupAudio(GroupAudio groupAudio);
     //删除groupAudio
     public String deleteGroupAudio(int groupId);
     //查询groupMcu
     public List<GroupAudio>getGroupAudio(GroupAudio groupAudio,int start,int pageSize);
     //新增groupMcuserver
     public String saveGroupMcuServer(GroupMcuServers groupMcu,Integer action) throws Exception;
     //修改groupMcuserver
     public String modifyGroupMcuServer(GroupMcuServers groupMcu)throws Exception;
     //删除groupMcuserver
     public String deleteGroupMcuServer(int serverId,Integer action,Integer groupId);
     //查询groupMcuserver
     public List<GroupMcuServers>getGroupMcuServer(GroupMcuServers groupMcu,int start,int pageSize);
     //新增groupAudioserver
     public String saveGroupAudioServer(GroupAudioServers groupMcu,Integer action)throws Exception;
     //修改groupAudioserver
     public String modifyGroupAudioServer(GroupAudioServers groupMcu)throws Exception;
     //删除groupAudioserver
     public String deleteGroupAudioServer(int groupId,Integer action,Integer gid);
     //查询groupAudioserver
     public List<GroupAudioServers>getGroupAudioServer(GroupAudioServers groupMcu,int start,int pageSize);
     //查询company
     public List<Company> getCompany(Company company,int start,int pagSize);
     //新增company
     public int saveCompany(Company company);
     //修改company
     public int ModifyCompany(Company company);
     //删除company 
     public int deleteCompany(int CompanyId);
     //查询configServer
     public List<ConfigServer> getConfigServer(ConfigServer configServer,int start,int pagSize);
     //新增configServer
     public int saveConfigServer(ConfigServer configServer);
     //修改configServer
     public int modifyConfigServer(ConfigServer configServer);
     //删除configServer
     public int deleteConfigServer(int serverId);
     //查询最大endUid
     public String getMaxEndUid();
     //新增dictionary
     public String saveDictionary(Dictionary dict);
     //修改dictionary
     public String modifyDictionary(Dictionary dict);
     //删除dictionary 
     public String deleteDictionary(String key);
     //查询dictionary
     public List<Dictionary> getDictionary(Dictionary dict,int start,int pagSize);
     //新增device
     public int saveDevice(Device device);
     //修改device
     public String modifyDevice(Device device);
     //删除device 
     public int deleteDevice(String key);
     //查询device
     public List<Device> getDevice(Device device,int start,int pagSize);
     //查询mucServerTree返回json
     public String getMcuServerTree(GroupMcuServers groupMcuServer);
     //查询audioServerTree返回json
     public String getAudioServerTree(GroupAudioServers groupMcuServer);
     //发送http消息
 	 public String send(List<String> ips,String msg,String type);

     
     

     

}
