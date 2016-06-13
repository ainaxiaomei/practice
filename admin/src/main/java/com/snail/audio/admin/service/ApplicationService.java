package com.snail.audio.admin.service;

import java.util.List;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import com.snail.audio.admin.dao.IAppResourceDao;
import com.snail.audio.admin.dao.IApplicationDao;
import com.snail.audio.admin.dao.IAudioDao;
import com.snail.audio.admin.dao.ICompanyDao;
import com.snail.audio.admin.dao.IDeviceDao;
import com.snail.audio.admin.dao.IDictionaryDao;
import com.snail.audio.admin.dao.IFtpServerDao;
import com.snail.audio.admin.dao.IGateDao;
import com.snail.audio.admin.dao.IGroupAudioDao;
import com.snail.audio.admin.dao.IGroupAudioServerDao;
import com.snail.audio.admin.dao.IGroupMCUDao;
import com.snail.audio.admin.dao.IGroupMcuServerDao;
import com.snail.audio.admin.dao.IIndexDbDao;
import com.snail.audio.admin.dao.IMCUDao;
import com.snail.audio.admin.dao.IndexDbDao;
import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.Company;
import com.snail.audio.admin.entity.Device;
import com.snail.audio.admin.entity.Dictionary;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.GroupAudio;
import com.snail.audio.admin.entity.GroupAudioServers;
import com.snail.audio.admin.entity.GroupMcu;
import com.snail.audio.admin.entity.GroupMcuServers;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.IndexGate;
import com.snail.audio.admin.entity.McuServer;

import net.sf.json.JSONArray;
@Service
public class ApplicationService implements IApplicationService {
	@Autowired
	private IApplicationDao appDao;
	@Autowired
	private ICompanyDao companyDao;
	@Autowired
	private IMCUDao mcuDao;
	@Autowired
	private IAudioDao audioDao;
	@Autowired
	private IAppResourceDao appResourceDao;
	@Autowired
	private IFtpServerDao ftpDao;
	@Autowired
	private IGateDao gateDao;
	@Autowired
	private IIndexDbDao indeDbDao;
	@Autowired
	private IGroupMCUDao groupMcuDao;
	@Autowired
	private IGroupMcuServerDao groupMcuServerDao;
	@Autowired
	private IGroupAudioServerDao groupAudioServerDao;
	@Autowired
	private IGroupAudioDao groupAudioDao;
	@Autowired
	private IDictionaryDao dictionaryDao;
	@Autowired
	private IDeviceDao deviceDao;
	
	public List<App> getApplication(App app,int start, int pageSize) {
		return appDao.getApplicationt(app, start,  pageSize);
	}
	@Override
	public int ModifyApplication(App app) {
		return appDao.ModityApplication(app);
	}
	@Override
	public int deleteApplication(int appId) {
		
		
		return appDao.deleteApplication(appId);
	}
	@Override
	public int addApplication(App app) {
		
		return appDao.addApplication(app);
	}
	@Override
	public List<McuServer> getMCUServer(McuServer mcu,int start,int pageSize) {
		return mcuDao.getMCU(mcu,start,pageSize);
	}
	@Override
	public List<AudioServer> getAudioServer(AudioServer audio, int start, int pageSize) {
		return audioDao.getAudioServer(audio, start, pageSize);
	}
	@Override
	public List<AppResource> getAppResource(AppResource appResource, int start, int pageSize) {
		return appResourceDao.getAppResource(appResource, start, pageSize);
	}
	@Override
	public List<FTPServer> getFtpServer(FTPServer ftp, int start, int pageSize) {
		return ftpDao.getFtp(ftp, start, pageSize);
	}
	@Override
	public int addMcu(McuServer mcu) {
		return mcuDao.addMCU(mcu);
	}
	@Override
	public int modifyMcu(McuServer mcu) {
		return mcuDao.modifyMCU(mcu);
	}
	@Override
	public int saveFtp(FTPServer ftp) {
		return ftpDao.saveFtp(ftp);
	}
	@Override
	public int modifyFtp(FTPServer ftp) {
		return ftpDao.modifyFtp(ftp);
	}
	@Override
	public int saveAudioServer(AudioServer audio) {
		return audioDao.saveAudioServer(audio);
	}
	@Override
	public int modifyAudioServer(AudioServer audio) {
		return audioDao.modifyAudioServer(audio);
	}
	@Override
	public String saveAppRes(AppResource appRes) {
		 appResourceDao.saveAppRes(appRes);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String modifyAppRes(AppResource appRes) {
		 appResourceDao.modifyAppRes(appRes);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public int deleteMcu(int id) {
		 mcuDao.deleteMCU(id);
		 return groupMcuServerDao.deleteGroupMCUByServerId(id);
	}
	@Override
	public int deleteAudioServer(int serverId) {
		 audioDao.deleteAudio(serverId);
		 return groupAudioServerDao.deleteByServerId(serverId);
	}
	@Override
	public int deleteGateServer(int serverId) {
		return gateDao.deleteGate(serverId);
	}
	@Override
	public int saveGateServer(IndexGate gate) {
		return gateDao.addGate(gate);
	}
	@Override
	public int modifyGate(IndexGate gate) {
		return gateDao.modifyGate(gate);
	}
	@Override
	public List<IndexGate> getGateServer(IndexGate gate, int start, int pageSize) {
		return gateDao.getGateServer(gate, start, pageSize);
	}
	@Override
	public List<IndexDb> getIndexDbServer(IndexDb indexdb, int start, int pageSize) {
		return indeDbDao.getIndexDb(indexdb, start, pageSize);
	}
	@Override
	public int saveIndexDbServer(IndexDb indexdb) {
		return indeDbDao.addIndexDb(indexdb);
	}
	@Override
	public String modifyIndexDbServer(IndexDb indexdb) {
		 indeDbDao.modifyIndexDb(indexdb);
		//查寻所有的indexGate中的httpurl
		 List<IndexGate> list=gateDao.getGateServer(new IndexGate(),  -1, -1); 
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String deleteIndexDbServer(int serverId) {
	      indeDbDao.deleteIndexDb(serverId);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String  saveGroupMcu(GroupMcu groupMcu) {
		groupMcuDao.addGroupMCU(groupMcu);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String modifyGroupMcu(GroupMcu groupMcu) {
		 groupMcuDao.modifyGroupMCU(groupMcu);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String deleteGroupMcu(int groupId) {
		 groupMcuDao.deleteGroupMCU(groupId);
		 groupMcuServerDao.deleteGroupMCUByGroupId(groupId);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public List<GroupMcu> getGroupMcu(GroupMcu groupMcu, int start, int pageSize) {
		return groupMcuDao.getGroupMCU(groupMcu, start, pageSize);
	}
	@Override
	public String saveGroupMcuServer(GroupMcuServers groupMcuServer) throws Exception {
		//检查serverId是否被占用
		int serverId=groupMcuServer.getServerId();
		if(serverId<0){
			throw new Exception("server id can not be null");
		}
		List<GroupMcuServers> serverList=groupMcuServerDao.getServerId(serverId);
		if(null!=serverList&&!serverList.isEmpty()){
			throw new Exception("server id is occupied! ");
		}
		 groupMcuServerDao.addGroupMcuServer(groupMcuServer);
		 //查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String modifyGroupMcuServer(GroupMcuServers groupMcu) {
		 groupMcuServerDao.modifyGroupMcuServer(groupMcu);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String deleteGroupMcuServer(int id) {
		 groupMcuServerDao.deleteGroupMcuServer(id);
		 //查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public List<GroupMcuServers> getGroupMcuServer(GroupMcuServers groupMcu, int start, int pageSize) {
		return groupMcuServerDao.getMCU(groupMcu, start, pageSize);
	}
	@Override
	public String saveGroupAudio(GroupAudio groupAudio) {
		 groupAudioDao.addGroupAudio(groupAudio);
		 //查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String modifyGroupAudio(GroupAudio groupAudio) {
		 groupAudioDao.modifyGroupAudio(groupAudio);
		 //查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String deleteGroupAudio(int groupId) {
		 groupAudioDao.deleteGroupAudio(groupId);
		 //查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public List<GroupAudio> getGroupAudio(GroupAudio groupAudio, int start, int pageSize) {
		return groupAudioDao.getGroupAudio(groupAudio, start, pageSize);
	}
	@Override
	public String saveGroupAudioServer(GroupAudioServers groupAudio) {
		 groupAudioServerDao.addGroupAudioServer(groupAudio);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String modifyGroupAudioServer(GroupAudioServers groupAudio) {
		 groupAudioServerDao.modifyGroupAudioServer(groupAudio);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
		
	}
	@Override
	public String deleteGroupAudioServer(int groupId) {
		 groupAudioServerDao.deleteGroupAudioServer(groupId);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public List<GroupAudioServers> getGroupAudioServer(GroupAudioServers groupAudio, int start, int pageSize) {
		return groupAudioServerDao.getAudio(groupAudio, start, pageSize);
	}
	@Override
	public String deleteAppRes(int id) {
		 appResourceDao.deleteAppRes(id);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public List<Company> getCompany(Company company, int start, int pagSize) {
		return companyDao.getCpmpany(company, start, pagSize);
	}
	@Override
	public int saveCompany(Company company) {
		return companyDao.saveCompany(company);
	}
	@Override
	public int ModifyCompany(Company company) {
		return companyDao.ModityCompany(company);
	}
	@Override
	public int deleteCompany(int CompanyId) {
		return companyDao.deleteCompany(CompanyId);
	}
	@Override
	public String getMaxEndUid() {
		return appDao.getMaxEndUid();
	}
	@Override
	public int deleteFtp(int serverId) {
		return ftpDao.deleteFtp(serverId);
	}
	@Override
	public int saveDictionary(Dictionary dict) {
		return dictionaryDao.addDictionary(dict);
	}
	@Override
	public String modifyDictionary(Dictionary dict) {
		 dictionaryDao.modifyDictionary(dict);
		 //查寻所有的indexGate中的httpurl
		 List<IndexGate> list=gateDao.getGateServer(new IndexGate(),  -1, -1); 
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public int deleteDictionary(String key) {
		return dictionaryDao.deleteDictionary(key);
	}
	@Override
	public List<Dictionary> getDictionary(Dictionary dict, int start, int pagSize) {
		return dictionaryDao.getDictionary(dict, start, pagSize);
	}
	@Override
	public int saveDevice(Device device) {
		return deviceDao.addDevice(device);
	}
	@Override
	public String modifyDevice(Device device) {
		  deviceDao.modifyDevice(device);
		 //查寻所有的indexGate中的httpurl
		 List<IndexGate> list=gateDao.getGateServer(new IndexGate(),  -1, -1); 
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public int deleteDevice(String key) {
		return deviceDao.deleteDevice(key);
	}
	@Override
	public List<Device> getDevice(Device device, int start, int pagSize) {
		return deviceDao.getDevice(device, start, pagSize);
	}

}
