package com.snail.audio.admin.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.lang.StringUtils;
import org.glassfish.jersey.client.ClientProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snail.audio.admin.dao.ApplicaitonDAO;
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
import com.snail.audio.admin.dao.IIndexDbGroupDao;
import com.snail.audio.admin.dao.IMCUDao;
import com.snail.audio.admin.dao.IndexDbDao;
import com.snail.audio.admin.dao.IndexDbServersDao;
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
import com.snail.audio.admin.entity.IndexDBGroup;
import com.snail.audio.admin.entity.IndexDBServer;
import com.snail.audio.admin.entity.IndexDb;
import com.snail.audio.admin.entity.IndexGate;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.exception.JSonException;
import com.snail.audio.admin.json.jsonObject.JsonTree;
import com.snail.audio.admin.json.jsonObject.JsonTreeBulider;
import net.sf.json.JSONArray;
@Service
public class ApplicationService implements IApplicationService {
	 static Logger logger = LoggerFactory.getLogger(ApplicationService.class);
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
	private IndexDbServersDao indexDbServersDao;
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
	@Autowired
	private IIndexDbGroupDao indexDbGroupDao;
	static class Action{
		static final int None=0;
		static final int Add=1;
		static final int Modify=2;
		static final int Delete=3;
	}
	public List<App> getApplication(App app,int start, int pageSize) {
		return appDao.getApplicationt(app, start,  pageSize);
	}
	@Override
	public int ModifyApplication(App app) {
		return appDao.ModityApplication(app);
	}
	@Override
	public int deleteApplication(int appId) {
		//删除app表
		appDao.deleteApplication(appId);
		//清除indexDbGroup中的appid字段
		List<IndexDBGroup> list=indexDbGroupDao.getIndexDbGroup(new IndexDBGroup(), -1, -1);
		if(null!=list&&!list.isEmpty()){
			for(int i=0;i<list.size();i++){
				String appIds=list.get(i).getAppids();
				String [] appids=appIds.split(",");
				List<String> appidsList=new ArrayList<String>();
				appidsList.addAll(Arrays.asList(appids));
				if(appidsList.contains(String.valueOf(appId))){
					appidsList.remove(String.valueOf(appId));
					StringBuilder newAppids=new StringBuilder();
					for(int a=0;a<appidsList.size();a++){
						if(a!=0){
							newAppids.append(",").append(appidsList.get(a));
						}else{
							newAppids.append(appidsList.get(a));
						}
					}
					IndexDBGroup dbgrp=new IndexDBGroup();
					dbgrp.setGroupId(list.get(i).getGroupId());
					dbgrp.setAppids(newAppids.toString());
					indexDbGroupDao.modifyIndexDbGroup(dbgrp);
					break;
				}
			}
		}
		//关联删除appResource中的appid
		return appResourceDao.deleteByAppId(appId);
		 
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
		//如果mcu属于一个组需要发送消息
		//检查mcu是否属于一个组，如果属于一个组不能删除
		mcuDao.modifyMCU(mcu);
		 GroupMcuServers groupMcuServer=new GroupMcuServers();
		 groupMcuServer.setServerId(mcu.getServerId());
		 List<GroupMcuServers> list=groupMcuServerDao.getMCU(groupMcuServer, -1, -1);
		 if(list!=null&&!list.isEmpty()){
			 return 1;
		 } 
		return 0;
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
		 audioDao.modifyAudioServer(audio);
		 GroupAudioServers groupAudioServer=new GroupAudioServers();
		 groupAudioServer.setServerId(audio.getServerId());
		 List<GroupAudioServers> list=groupAudioServerDao.getAudio(groupAudioServer, -1, -1);
		 if(list!=null&&!list.isEmpty()){
			 return 1;
		 } 
		return 0;
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
	public int deleteMcu(int id) throws Exception {
		 //检查mcu是否属于一个组，如果属于一个组不能删除
		 GroupMcuServers groupMcuServer=new GroupMcuServers();
		 groupMcuServer.setServerId(id);
		 List<GroupMcuServers> list=groupMcuServerDao.getMCU(groupMcuServer, -1, -1);
		 if(list!=null&&!list.isEmpty()){
			 throw new RuntimeException("属于一个组，则需要从组中解除才能删除");
		 } 
		 return mcuDao.deleteMCU(id);
		 //删除groupmcuserver同时删除子层级
		 //return deleteMcuByParentid(id);
	}
	@Override
	public int deleteAudioServer(int serverId) {
		//如果有关联不能删除
		 
		 GroupAudioServers groupAudioServer=new GroupAudioServers();
		 groupAudioServer.setServerId(serverId);
		 List<GroupAudioServers> list=groupAudioServerDao.getAudio(groupAudioServer, -1, -1);
		 if(list!=null&&!list.isEmpty()){
			 throw new RuntimeException("属于一个组，则需要从组中解除才能删除");
		 } 
		 return audioDao.deleteAudio(serverId);
		 //return deleteAudioByParentid(serverId);
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
		//将indexdb中的appids都设为占用状态
		appDao.setAppOccupied(indexdb.getAppids(), true);
		return indeDbDao.addIndexDb(indexdb);
	}
	@Override
	public String modifyIndexDbServer(IndexDb indexdb) {
		//将indexdb中的appis设为可用状态
		  IndexDb db=new IndexDb();
		  db.setServerId(indexdb.getServerId());
		  List<IndexDb> ls=indeDbDao.getIndexDb(db, -1, -1);
	      appDao.setAppOccupied(ls.get(0).getAppids(), false);
		//将indexdb中的appids都设为占用状态
	    appDao.setAppOccupied(indexdb.getAppids(), true);
		 indeDbDao.modifyIndexDb(indexdb);
		//查寻所有的indexGate中的httpurl
		 List<IndexGate> list=gateDao.getGateServer(new IndexGate(),  -1, -1); 
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String deleteIndexDbServer(int serverId) {
		 //将indexdb中的appis设为可用状态
		  IndexDb db=new IndexDb();
		  db.setServerId(serverId);
		  List<IndexDb> ls=indeDbDao.getIndexDb(db, -1, -1);
	      appDao.setAppOccupied(ls.get(0).getAppids(), false);
	      indeDbDao.deleteIndexDb(serverId);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String  saveGroupMcu(GroupMcu groupMcu) {
		groupMcuDao.addGroupMCU(groupMcu);
		//查寻所有的indexDb中的httpurl
		// List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		// return JSONArray.fromObject(list).toString();
		return "success";
	}
	@Override
	public String modifyGroupMcu(GroupMcu groupMcu) {
		 groupMcuDao.modifyGroupMCU(groupMcu);
		//修改组，若group_mcu_servers有相关信息则发送http信息 cmd=mcugroup_change&id=组号&act=2
		 GroupMcuServers groupMcuServer=new GroupMcuServers();
		 groupMcuServer.setGroupId(groupMcu.getGroupId());
		 List<GroupMcuServers> list=groupMcuServerDao.getMCU(groupMcuServer, -1, -1);
		 if(list!=null&&!list.isEmpty()){
			 return "send";
		 }
		 return "success";
	}
	@Override
	public String deleteGroupMcu(int groupId) {
		 groupMcuDao.deleteGroupMCU(groupId);
		 //查询是否有关联如果有关联需要发送消息
		 GroupMcuServers groupMcuServer=new GroupMcuServers();
		 groupMcuServer.setGroupId(groupId);
		 List<GroupMcuServers> list=groupMcuServerDao.getMCU(groupMcuServer, -1, -1);
		 if(list!=null&&!list.isEmpty()){
			 groupMcuServerDao.deleteGroupMCUByGroupId(groupId);
			 return "send";
		 }
		 return "success";
	}
	@Override
	public List<GroupMcu> getGroupMcu(GroupMcu groupMcu, int start, int pageSize) {
		return groupMcuDao.getGroupMCU(groupMcu, start, pageSize);
	}
	@Override
	public String saveGroupMcuServer(GroupMcuServers groupMcuServer,Integer action) throws Exception {
		 mcuCheck(groupMcuServer);
		 groupMcuServerDao.addGroupMcuServer(groupMcuServer);
		 //将action保存到mcugroup
		 GroupMcu groupMcu=new GroupMcu();
		 groupMcu.setFlag(action);
		 groupMcu.setGroupId(groupMcuServer.getGroupId());
		 groupMcuDao.modifyGroupMCU(groupMcu);
		 return "success";
	}
	private void mcuCheck(GroupMcuServers groupMcuServer) throws JSonException {
		//检查serverId是否被占用
		int serverId=groupMcuServer.getServerId();
		if(serverId<0){
			throw new JSonException("server id can not be null");
		}
		List<GroupMcuServers> serverList=groupMcuServerDao.getServerId(serverId);
		if(null!=serverList&&!serverList.isEmpty()){
			throw new JSonException("server id is occupied! ");
		}
	}
	@Override
	public String modifyGroupMcuServer(GroupMcuServers groupMcu) throws Exception {
		 //mcuCheck(groupMcu);
		 groupMcuServerDao.modifyGroupMcuServer(groupMcu);
		//查寻所有的indexDb中的httpurl
		// List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		// return JSONArray.fromObject(list).toString();
		 return "success";
	}
	@Override
	public String deleteGroupMcuServer(int id,Integer action,Integer groupId) {
		deleteMcuByParentid(id);
		 //将action保存到mcugroup
		 GroupMcu groupMcu=new GroupMcu();
		 groupMcu.setFlag(action);
		 groupMcu.setGroupId(groupId);
		 groupMcuDao.modifyGroupMCU(groupMcu);
		return "success";
	}
	public int deleteMcuByParentid(int id){
		//查出该节点的子节点
		List<GroupMcuServers> list=groupMcuServerDao.getchildren(id);
		if(list==null||list.isEmpty()){
		 //没有子节点直接删除
			groupMcuServerDao.deleteGroupMCUByServerId(id);
		}else{
			//先删除父节点
			groupMcuServerDao.deleteGroupMCUByServerId(id);
			//递归调用
			for(int i=0;i<list.size();i++){
				deleteMcuByParentid(list.get(i).getServerId());
			}
		}
		return 0;
		
	}
	public int deleteAudioByParentid(int id){
		//查出该节点的子节点
		List<GroupAudioServers> list=groupAudioServerDao.getchildren(id);
		if(list==null||list.isEmpty()){
			//没有子节点直接删除
			groupAudioServerDao.deleteByServerId(id);
		}else{
			//先删除父节点
			groupAudioServerDao.deleteByServerId(id);
			//递归调用
			for(int i=0;i<list.size();i++){
				deleteAudioByParentid(list.get(i).getServerId());
			}
		}
		return 0;
		
	}
	@Override
	public List<GroupMcuServers> getGroupMcuServer(GroupMcuServers groupMcu, int start, int pageSize) {
		return groupMcuServerDao.getMCU(groupMcu, start, pageSize);
	}
	@Override
	public String saveGroupAudio(GroupAudio groupAudio) {
		 groupAudioDao.addGroupAudio(groupAudio);
		 //查寻所有的indexDb中的httpurl
		 //List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		// return JSONArray.fromObject(list).toString();
		 return "success";
	}
	@Override
	public String modifyGroupAudio(GroupAudio groupAudio) {
		 groupAudioDao.modifyGroupAudio(groupAudio);
		//修改组，若group_mcu_servers有相关信息则发送http信息 cmd=mcugroup_change&id=组号&act=2
		 GroupAudioServers groupAudioServer=new GroupAudioServers();
		 groupAudioServer.setGroupId(groupAudio.getGroupId());
		 List<GroupAudioServers> list=groupAudioServerDao.getAudio(groupAudioServer,  -1, -1);
		 if(list!=null&&!list.isEmpty()){
			 return "send";
		 }
		 return "success";
	}
	@Override
	public String deleteGroupAudio(int groupId) {
		 groupAudioDao.deleteGroupAudio(groupId);
		 //查询是否有关联如果有关联需要发送消息
		 GroupAudioServers groupAudioServer=new GroupAudioServers();
		 groupAudioServer.setGroupId(groupId);
		 List<GroupAudioServers> list=groupAudioServerDao.getAudio(groupAudioServer, -1, -1);
		 if(list!=null&&!list.isEmpty()){
			 groupAudioServerDao.deleteByGroupId(groupId);
			 return "send";
		 }
		 return "success";
	}
	@Override
	public List<GroupAudio> getGroupAudio(GroupAudio groupAudio, int start, int pageSize) {
		return groupAudioDao.getGroupAudio(groupAudio, start, pageSize);
	}
	private void audioCheck(GroupAudioServers groupAudioServer) throws JSonException {
		//检查serverId是否被占用
		int serverId=groupAudioServer.getServerId();
		if(serverId<0){
			throw new JSonException("server id can not be null");
		}
		List<GroupAudioServers> serverList=groupAudioServerDao.getAudioServerId(serverId);
		if(null!=serverList&&!serverList.isEmpty()){
			throw new JSonException("server id is occupied! ");
		}
	}
	@Override
	public String saveGroupAudioServer(GroupAudioServers groupAudio) throws Exception {
		 audioCheck(groupAudio);
		 groupAudioServerDao.addGroupAudioServer(groupAudio);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String modifyGroupAudioServer(GroupAudioServers groupAudio) throws Exception {
		// audioCheck(groupAudio);
		 groupAudioServerDao.modifyGroupAudioServer(groupAudio);
		//查寻所有的indexDb中的httpurl
		 List<IndexDb> list=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
		 return JSONArray.fromObject(list).toString();
		
	}
	@Override
	public String deleteGroupAudioServer(int groupId) {
		deleteAudioByParentid(groupId);
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
	@Override
	public String getMcuServerTree(GroupMcuServers groupMcuServer) {
		List<GroupMcuServers> list=this.getGroupMcuServer(groupMcuServer,-1,-1);
		List<JsonTree> treeList=new ArrayList<JsonTree>();
		for(int i=0;i<list.size();i++){
			JsonTreeBulider builder=new JsonTreeBulider();
			if(list.get(i).getLevel()==0){
				//根层级
				 builder=JsonTree.jsonTreeBuilder(String.valueOf(list.get(i).getServerId()),"root");
			}else{
				 builder=JsonTree.jsonTreeBuilder(String.valueOf(list.get(i).getServerId()),String.valueOf(list.get(i).getLeftParentId()));
			}
			//查询名称
			McuServer mcu=new McuServer();
			mcu.setServerId(list.get(i).getServerId());
			List<McuServer> mcuList=mcuDao.getMCU(mcu, -1, -1);
			if(list!=null&&!list.isEmpty()){
				builder.text(mcuList.get(0).getServerName());
			}else{
				//其实是错误数据
				builder.text(String.valueOf(list.get(i).getServerId()));
			}
			
			builder.group(String.valueOf(list.get(i).getGroupId()))
			.level(String.valueOf(list.get(i).getLevel()))
			.groupServerId(String.valueOf(list.get(i).getId()));
			treeList.add(builder.build());
		}
		JsonTree rootTree=JsonTree.jsonTreeBuilder("root","#")
		.text("Mcu Server Tree")
		.group("-1")
		.level("-1")
		.groupServerId("-1")
		.build();
		treeList.add(rootTree);
		String result =JSONArray.fromObject(treeList).toString();
		return result;
	}
	@Override
	public String getAudioServerTree(GroupAudioServers groupAudioServer) {
		List<GroupAudioServers> list=this.getGroupAudioServer(groupAudioServer,-1,-1);
		List<JsonTree> treeList=new ArrayList<JsonTree>();
		for(int i=0;i<list.size();i++){
			JsonTreeBulider builder=new JsonTreeBulider();
			if(list.get(i).getLevel()==0){
				//根层级
				 builder=JsonTree.jsonTreeBuilder(String.valueOf(list.get(i).getServerId()),"root");
			}else{
				 builder=JsonTree.jsonTreeBuilder(String.valueOf(list.get(i).getServerId()),String.valueOf(list.get(i).getLeftParentId()));
			}
			//查询名称
			AudioServer audio=new AudioServer();
			audio.setServerId(list.get(i).getServerId());
			List<AudioServer> mcuList=audioDao.getAudioServer(audio, -1, -1);
			if(list!=null&&!list.isEmpty()){
				builder.text(mcuList.get(0).getServerName());
			}else{
				//其实是错误数据
				builder.text(String.valueOf(list.get(i).getServerId()));
			}
			
			builder.group(String.valueOf(list.get(i).getGroupId()))
			.level(String.valueOf(list.get(i).getLevel()))
			.groupServerId(String.valueOf(list.get(i).getId()));
			treeList.add(builder.build());
		}
		JsonTree rootTree=JsonTree.jsonTreeBuilder("root","#")
		.text("Audio Server Tree")
		.group("-1")
		.level("-1")
		.groupServerId("-1")
		.build();
		treeList.add(rootTree);
		String result =JSONArray.fromObject(treeList).toString();
		return result;
	}
	@Override
	public List<App> selectApp(App app, Integer serverId, int start, int pageSize) {
		//查出serverId中的applds
		IndexDb indexDb=new IndexDb();
		indexDb.setServerId(serverId);
		if(serverId!=null&&serverId>0){
			List<IndexDb> list=indeDbDao.getIndexDb(indexDb, -1, -1);
			if(list!=null&&list.size()>0){
				String[] appids=list.get(0).getAppids().split(",");
				return appDao.selectApp(app, appids, start, pageSize);
			}else{
				//错误数据
				return appDao.selectApp(app, null, start, pageSize);
			}
		}else{
			return appDao.selectApp(app, null, start, pageSize);
		}
	}
	@Override
	public String send(List<String> ips, String msg, String type) {
		List<String> failList=new ArrayList<String>();
		if(!ips.isEmpty()){
			//直接发送给相应的ip
			for(int i=0;i<ips.size();i++){
				Client client = ClientBuilder.newClient();
				client.property(ClientProperties.CONNECT_TIMEOUT, 1000);
			    client.property(ClientProperties.READ_TIMEOUT,    1000);
			    String url=ips.get(i);
			    if(StringUtils.isBlank(url)){
			    	logger.debug("illegel httpurl:"+url);
			    	continue;
			    }
			    logger.debug("-----start send message to:"+url);
		    	WebTarget target = client.target(url);
		    	Response response=null;
		    	try{
		             response= target.request(MediaType.TEXT_PLAIN).get();
			    	if(response.getStatus()==200){
			    		String returnValue=response.readEntity(String.class);
			    		logger.debug("-----send message success to:"+url);
			    	}else{
			    		//发送失败
			    		failList.add(url);
			    		logger.debug("-----send message fail to:"+url);
			    	}
		    	}catch(Exception e){
		    		//发送失败
		    		failList.add(url);
		    		logger.debug("-----send message fail to:"+url);
		    	}finally{
		    		if(response!=null){
		    			response.close();
		    		}
		    		if(client!=null){
		    			client.close();
		    		}
			    	
		    	}
			}
		}else{
			List<String> ipList=new ArrayList<String>();
			if("GATE".equals(type)){
				//向网关服务器发送
				//查询网关服务器地址
				List<IndexGate> list=gateDao.getGateServer(new IndexGate(), -1, -1);
				for(int i=0;i<list.size();i++){
					ipList.add("http://"+list.get(i).getHttpUrl()+"/"+msg);
				}
			}else if("DB".equals(type)){
				//向DB服务器发送
				//查询服务器地址
				List<IndexDBServer> list=indexDbServersDao.getIndexDb(new IndexDBServer(), -1, -1);
				for(int i=0;i<list.size();i++){
					ipList.add("http://"+list.get(i).getHttpUrl()+"/"+msg);
				}
			}else if("ALL".equals(type)){
				//两个服务器都发送
				List<IndexGate> list=gateDao.getGateServer(new IndexGate(), -1, -1);
				for(int i=0;i<list.size();i++){
					ipList.add("http://"+list.get(i).getHttpUrl()+"/"+msg);
				}
				List<IndexDb> list1=indeDbDao.getIndexDb(new IndexDb(), -1, -1);
				for(int i=0;i<list1.size();i++){
					ipList.add("http://"+list1.get(i).getHttpUrl()+"/"+msg);
				}
			}else if("MCU".equals("MCU")){
				return send4mcuandaudio("cmd=mcugroup_change");
			}else if("AUDIO".equals("AUDIO")){
				return send4mcuandaudio("cmd=audiogroup_change");
			}
			doSendMessage(ipList,failList);
			
		}
		return JSONArray.fromObject(failList).toString();
	}
	private void doSendMessage(List<String> ipList,List<String> failList) {
		if(failList==null){
			return ;
		}
		for(int i=0;i<ipList.size();i++){
			Client client = ClientBuilder.newClient();
			client.property(ClientProperties.CONNECT_TIMEOUT, 1000);
		    client.property(ClientProperties.READ_TIMEOUT,    1000);
			WebTarget target = client.target(ipList.get(i));
			Response response=null;
			try{
		         response= target.request(MediaType.TEXT_PLAIN).get();
		    	if(response.getStatus()==200){
		    		String returnValue=response.readEntity(String.class);
		    	}else{
		    		//发送失败
		    		failList.add(ipList.get(i));
		    	}
			}catch(Exception e){
				//发送失败
				failList.add(ipList.get(i));
			}finally{
				if(response!=null){
					response.close();
				}
				if(client!=null){
					client.close();
				}
		    	
			}
			
			
		}
	}
	private String send4mcuandaudio(String cmd){
		//查询groupmcu中flage不为0的
		GroupMcu groupMcu =new GroupMcu();
		groupMcu.setFlag(0);
		List<GroupMcu> list=groupMcuDao.getMessages(groupMcu, -1, -1);
		List<IndexDBServer> dblist=indexDbServersDao.getIndexDb(new IndexDBServer(), -1, -1);
		//消息=ip+cmd+组号+act
		List<String> msgs=new ArrayList<String>();
		for(GroupMcu gmcu:list){
			switch (gmcu.getFlag()) {
			case Action.Add:
				for(IndexDBServer db:dblist){
					StringBuilder sb=new StringBuilder();
					sb.append("http://")
					.append(db.getHttpUrl())
					.append("/")
					.append(cmd)
					.append("&id=")
					.append(gmcu.getGroupId())
					.append("&act=")
					.append(Action.Add);
					msgs.add(sb.toString());
				}
				//清除标志
				groupMcu.setFlag(0);
				groupMcu.setGroupId(gmcu.getGroupId());
				groupMcuDao.modifyGroupMCU(groupMcu);
				break;
			case Action.Modify:
				for(IndexDBServer db:dblist){
					StringBuilder sb=new StringBuilder();
					sb.append("http://")
					.append(db.getHttpUrl())
					.append("/")
					.append(cmd)
					.append("&id=")
					.append(gmcu.getGroupId())
					.append("&act=")
					.append(Action.Modify);
					msgs.add(sb.toString());
				}
				//清除标志
				groupMcu.setFlag(0);
				groupMcu.setGroupId(gmcu.getGroupId());
				groupMcuDao.modifyGroupMCU(groupMcu);
				break;
			case Action.Delete:
				for(IndexDBServer db:dblist){
					StringBuilder sb=new StringBuilder();
					sb.append("http://")
					.append(db.getHttpUrl())
					.append("/")
					.append(cmd)
					.append("&id=")
					.append(gmcu.getGroupId())
					.append("&act=")
					.append(Action.Delete-3);//删除是0
					msgs.add(sb.toString());
				}
				//清除标志
				groupMcu.setFlag(0);
				groupMcu.setGroupId(gmcu.getGroupId());
				groupMcuDao.modifyGroupMCU(groupMcu);
				
				break;

			default:
				break;
			}
		
		}
		List<String> failList=new ArrayList<String>();
		doSendMessage(msgs, failList);
		return JSONArray.fromObject(failList).toString();
		
	}
	@Override
	public List<IndexDBServer> getIndexDbServers(IndexDBServer indexdb, int start, int pageSize) {
		return indexDbServersDao.getIndexDb(indexdb, start, pageSize);
	}
	@Override
	public String deleteIndexDbServers(int serverId) {
		//如果groupId不为0或者空不能删除
		IndexDBServer db =new IndexDBServer();
		db.setServerId(serverId);
		List<IndexDBServer> list=indexDbServersDao.getIndexDb(db, -1, -1);
		if(list!=null&&!list.isEmpty()){
			Integer gid=list.get(0).getGroupId();
			if(gid!=null&&gid>0){
				throw new RuntimeException("只有groupId为0才能删除!");
			}
		}
		 indexDbServersDao.deleteIndexDb(serverId);
		//查寻所有的indexDb中的httpurl
		 List<IndexDBServer> list1=indexDbServersDao.getIndexDb(new IndexDBServer(), -1, -1);
		 return JSONArray.fromObject(list1).toString();
		
	}
	@Override
	public int saveIndexDbServers(IndexDBServer indexdb) {
		return indexDbServersDao.addIndexDb(indexdb);
	}
	@Override
	public String modifyIndexDbServers(IndexDBServer indexdb) {
		indexDbServersDao.modifyIndexDb(indexdb);
		//查寻所有的indexGate中的httpurl
		 List<IndexGate> list=gateDao.getGateServer(new IndexGate(),  -1, -1); 
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public List<IndexDBGroup> getIndexDbGroup(IndexDBGroup dbGrp, int start, int pageSize) {
		return indexDbGroupDao.getIndexDbGroup(dbGrp, start, pageSize);
	}
	@Override
	public int saveIndexDbGroup(IndexDBGroup dbGrp) {
		indexDbGroupDao.addIndexDbGroup(dbGrp);
		//设置indexDbServer的groupId
		if(dbGrp.getServerid1()!=null&&dbGrp.getServerid1()>0){
			IndexDBServer db=new IndexDBServer();
			db.setServerId(dbGrp.getServerid1());
			List<IndexDBServer> list =indexDbServersDao.getIndexDb(db, -1, -1);
			if(list!=null&&list.size()>0){
				db=list.get(0);
				db.setGroupId(dbGrp.getGroupId());
				indexDbServersDao.modifyIndexDb(db);
			}
		}
		if(dbGrp.getServerid2()!=null&&dbGrp.getServerid2()>0){
			IndexDBServer db=new IndexDBServer();
			db.setServerId(dbGrp.getServerid2());
			List<IndexDBServer> list =indexDbServersDao.getIndexDb(db, -1, -1);
			if(list!=null&&list.size()>0){
				db=list.get(0);
				db.setGroupId(dbGrp.getGroupId());
				indexDbServersDao.modifyIndexDb(db);
			}
		}
		
		//将IndexDBGroup中的appids都设为占用状态
		appDao.setAppOccupied(dbGrp.getAppids(), true);
		return 0;
	}
	@Override
	public String modifyIndexDbGroup(IndexDBGroup dbGrp) {
		//将indexdb中的appis设为可用状态
		  IndexDBGroup dbgrp=new IndexDBGroup();
		  dbgrp.setGroupId(dbGrp.getGroupId());
		  List<IndexDBGroup> ls=indexDbGroupDao.getIndexDbGroup(dbgrp, -1, -1);
	      appDao.setAppOccupied(ls.get(0).getAppids(), false);
		//将indexdb中的appids都设为占用状态
	    appDao.setAppOccupied(dbGrp.getAppids(), true);
	    indexDbGroupDao.modifyIndexDbGroup(dbGrp);
	    //时间不够简单实现
	    int oldServiceId1=ls.get(0).getServerid1()==null?0:ls.get(0).getServerid1().intValue();
	    int oldServiceId2=ls.get(0).getServerid2()==null?0:ls.get(0).getServerid2().intValue();
	    int curServiceId1=dbGrp.getServerid1()==null?0:dbGrp.getServerid1().intValue();
	    int curServiceId2=dbGrp.getServerid2()==null?0:dbGrp.getServerid2().intValue();
	    if(oldServiceId1!=curServiceId1){
	    	//将oldServiceId1的groupid设置为0
	    	IndexDBServer old=new IndexDBServer();
	    	old.setServerId(oldServiceId1);
	    	old.setGroupId(0);
	    	indexDbServersDao.modifyIndexDb(old);
	    	//将curServiceId1的groupId设置为当前的groupid
	    	IndexDBServer cur=new IndexDBServer();
	    	cur.setServerId(curServiceId1);
	    	cur.setGroupId(dbGrp.getGroupId());
	    	indexDbServersDao.modifyIndexDb(cur);
	    }
	    if(oldServiceId2!=curServiceId2){
	    	//将oldServiceId2的groupid设置为0
	    	IndexDBServer old=new IndexDBServer();
	    	old.setServerId(oldServiceId2);
	    	old.setGroupId(0);
	    	indexDbServersDao.modifyIndexDb(old);
	    	//将curServiceId2的groupId设置为当前的groupid
	    	IndexDBServer cur=new IndexDBServer();
	    	cur.setServerId(curServiceId2);
	    	cur.setGroupId(dbGrp.getGroupId());
	    	indexDbServersDao.modifyIndexDb(cur);
	    }
		//查寻所有的indexGate中的httpurl
		 List<IndexGate> list=gateDao.getGateServer(new IndexGate(),  -1, -1); 
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public String deleteIndexDbGroup(int grpId) {
		
		 //将indexdb中的appis设为可用状态
		  IndexDBGroup dbgrp=new IndexDBGroup();
		  dbgrp.setGroupId(grpId);
		  List<IndexDBGroup> ls=indexDbGroupDao.getIndexDbGroup(dbgrp, -1, -1);
	      appDao.setAppOccupied(ls.get(0).getAppids(), false);
	      //将service1和service简单实现时间不够
	      IndexDBServer indexDb =new IndexDBServer();
	      Integer serverId1=ls.get(0).getServerid1();
	      if(serverId1!=null&&serverId1>0)
	      indexDb.setServerId(serverId1);
	      indexDb.setGroupId(0);
	      indexDbServersDao.modifyIndexDb(indexDb);
	      Integer serverId2=ls.get(0).getServerid2();
	      if(serverId2!=null&&serverId2>0)
	      indexDb.setServerId(serverId2);
	      indexDb.setGroupId(0);
	      indexDbServersDao.modifyIndexDb(indexDb);
	      //删除
	      indexDbGroupDao.deleteIndexDbGroup(grpId);
		//查寻所有的httpurl
		 List<IndexDBGroup> list=indexDbGroupDao.getIndexDbGroup(new IndexDBGroup(), -1, -1);
		 return JSONArray.fromObject(list).toString();
	}
	@Override
	public List<IndexDBServer> selectIndexDb(IndexDBServer indexDb, int start, int end) {
		return indexDbServersDao.selectIndexDb(indexDb, start, end);
	}

}
