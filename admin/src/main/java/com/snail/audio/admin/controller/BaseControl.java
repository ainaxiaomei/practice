package com.snail.audio.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.StringUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.snail.audio.admin.dao.MCUDao;
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
import com.snail.audio.admin.json.jsonObject.JsonTree;
import com.snail.audio.admin.json.jsonObject.JsonTreeBulider;
import com.snail.audio.admin.json.jsonObject.JsonTreeLiAttr;
import com.snail.audio.admin.service.IApplicationService;

import net.sf.json.JSONArray;

@Controller
public class BaseControl {
	@RequestMapping("/mcuServerAdd")
	public String mcuServerAdd(Model model,HttpServletRequest request){
		
		return "mcuServerAdd";
		
	}
	@RequestMapping("/deviceAdd")
	public String deviceAdd(Model model,HttpServletRequest request){
		
		return "deviceAdd";
		
	}
	@RequestMapping("/appAdd")
	public String appAdd(Model model,HttpServletRequest request){
		
		return "appAdd";
		
	}
	@RequestMapping("/gateServerAdd")
	public String gateServerAdd(Model model,HttpServletRequest request){
		
		return "gateServerAdd";
		
	}
	@RequestMapping("/ftpServerAdd")
	public String toFtpServerAdd(Model model,HttpServletRequest request){
		
		return "ftpServerAdd";
		
	}
	@RequestMapping("/audioServerAdd")
	public String toAudioServerAdd(Model model,HttpServletRequest request){
		
		return "audioServerAdd";
		
	}
	@RequestMapping("/appResAdd")
	public String toAppResAdd(Model model,HttpServletRequest request){
		
		return "appResAdd";
		
	}
	@RequestMapping("/indexDbServerAdd")
	public String toIndexDbServerAdd(Model model,HttpServletRequest request){
		
		return "indexDbServerAdd";
		
	}
	@RequestMapping("/indexDbServersAdd")
	public String toIndexDbServersAdd(Model model,HttpServletRequest request){
		
		return "indexDbServersAdd";
		
	}
	@RequestMapping("/groupMcuServerAdd")
	public String toGroupMcuServerAdd(Model model,HttpServletRequest request){
		
		return "groupMcuServerAdd";
		
	}
	@RequestMapping("/groupAudioServer")
	public String toGroupAudioServer(Model model,HttpServletRequest request){
		
		return "groupAudioServerTree";
		
	}
	@RequestMapping("/groupAudioServerAdd")
	public String toGroupAudioServerAdd(Model model,HttpServletRequest request){
		
		return "groupAudioServerAdd";
		
	}
	
	@RequestMapping("/mcuServer")
	public String toMCUServer(Model model,HttpServletRequest request){
		
		return "mcuServer";
		
	}
	@RequestMapping("/dictionaryAdd")
	public String toDictionaryAdd(Model model,HttpServletRequest request){
		
		return "dictionaryAdd";
		
	}
	@RequestMapping("/company")
	public String toCompany(Model model,HttpServletRequest request){
		
		return "company";
		
	}
	@RequestMapping("/app")
	public String toApp(Model model,HttpServletRequest request){
		
		return "app";
		
	}
	@RequestMapping("/audioServer")
	public String toAudioServer(Model model,HttpServletRequest request){
		
		return "audioServer";
		
	}
	@RequestMapping("/gateServer")
	public String toGateServer(Model model,HttpServletRequest request){
		
		return "gateServer";
		
	}
	@RequestMapping("/indexDbServer")
	public String toIndexDbServer(Model model,HttpServletRequest request){
		
		return "indexDbServer";
		
	}
	@RequestMapping("/indexDbServers")
	public String toIndexDbServers(Model model,HttpServletRequest request){
		
		return "indexDbServers";
		
	}
	@RequestMapping("/indexDbGroup")
	public String toIndexDbGroup(Model model,HttpServletRequest request){
		
		return "indexDbGroup";
		
	}
	@RequestMapping("/indexDbGroupAdd")
	public String toindexDbGroupAdd(Model model,HttpServletRequest request){
		
		return "indexDbGroupAdd";
		
	}
	@RequestMapping("/groupAudio")
	public String toGroupAudio(Model model,HttpServletRequest request){
		
		return "groupAudio";
		
	}
	@RequestMapping("/home")
	public String toHome(Model model,HttpServletRequest request){
		
		return "home";
		
	}
	@RequestMapping("/appResource")
	public String toAppResource(Model model,HttpServletRequest request){
		
		return "appResource";
		
	}
	@RequestMapping("/ftpServer")
	public String toFtpServer(Model model,HttpServletRequest request){
		
		return "ftpServer";
		
	}
	@RequestMapping("/dictionary")
	public String toDictionary(Model model,HttpServletRequest request){
		
		return "dictionary";
		
	}
	@RequestMapping("/groupMcu")
	public String toGroupMcu(Model model,HttpServletRequest request){
		
		return "groupMcu";
		
	}
	@RequestMapping("/companyAdd")
	public String toCompanyAdd(Model model,HttpServletRequest request){
		
		return "companyAdd";
		
	}
	@RequestMapping("/groupMcuAdd")
	public String toGroupMcuAdd(Model model,HttpServletRequest request){
		
		return "groupMcuAdd";
		
	}
	@RequestMapping("/groupAudioAdd")
	public String toGroupAudioAdd(Model model,HttpServletRequest request){
		
		return "groupAudioAdd";
		
	}
	@RequestMapping("/groupMcuServer")
	public String toGroupMcuServer(Model model,HttpServletRequest request){
		
		return "groupMcuServerTree";
		
	}
	@RequestMapping("/configServerAdd")
	public String toConfigServerAdd(Model model,HttpServletRequest request){
		
		return "configServerAdd";
		
	}
	@RequestMapping("/configServer")
	public String toConfigServer(Model model,HttpServletRequest request){
		
		return "configServer";
		
	}
	@RequestMapping("/device")
	public String toDevice(Model model,HttpServletRequest request){
		
		return "device";
		
	}
	
	
	@RequestMapping("/audioServerSearch")
	public void audioServerSearch(HttpServletRequest request,HttpServletResponse response,AudioServer audio) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<AudioServer> list=service.getAudioServer(audio,-1,-1);
		//将list转换为json字符创
	    String result =JSONArray.fromObject(list).toString();
	    response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/GroupMcuServerTree")
	public void getGroupMcuServerTree(HttpServletRequest request,HttpServletResponse response,GroupMcuServers groupMcuServer) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String result=service.getMcuServerTree(groupMcuServer);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/groupAudioServerTree")
	public void getGroupAudioServerTree(HttpServletRequest request,HttpServletResponse response,GroupAudioServers groupAudioServer) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String result=service.getAudioServerTree(groupAudioServer);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/deviceSearch")
	public void deviceSearch(HttpServletRequest request,HttpServletResponse response,Device device) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<Device> list=service.getDevice(device, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/configServerSearch")
	public void configServerSearch(HttpServletRequest request,HttpServletResponse response,ConfigServer config) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<ConfigServer> list=service.getConfigServer(config, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/appSearch")
	public void appSearch(HttpServletRequest request,HttpServletResponse response,App app) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<App> list=service.getApplication(app, -1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/appSelect")
	public void appSelect(HttpServletRequest request,HttpServletResponse response,App app,@RequestParam(value="serverId",required=false)Integer serverId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<App> list=service.selectApp(app, serverId,-1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/comapnySearch")
	public void comapnySearch(HttpServletRequest request,HttpServletResponse response,Company company) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<Company> list=service.getCompany(company,-1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/groupMcuSearch")
	public void groupMcuServerSearch(HttpServletRequest request,HttpServletResponse response,GroupMcu groupMcu) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<GroupMcu> list=service.getGroupMcu(groupMcu, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/ftpServerSearch")
	public void ftpServerSearch(HttpServletRequest request,HttpServletResponse response,FTPServer ftp) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<FTPServer> list=service.getFtpServer(ftp,-1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/appResourceSearch")
	public void appResourceSearch(HttpServletRequest request,HttpServletResponse response,AppResource appResource) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<AppResource> list=service.getAppResource(appResource, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/mcuServerSearch")
	public void mcuServerSearch(HttpServletRequest request,HttpServletResponse response,McuServer mcu) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<McuServer> list=service.getMCUServer(mcu,-1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/groupAudioServerSearch")
	public void mcuServerSearch(HttpServletRequest request,HttpServletResponse response,GroupAudioServers groupAudio) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<GroupAudioServers> list=service.getGroupAudioServer(groupAudio,-1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/gateServerSearch")
	public void gateServerSearch(HttpServletRequest request,HttpServletResponse response,IndexGate gate) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<IndexGate> list=service.getGateServer(gate,-1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/indexDbServerSearch")
	public void indexDbServerSearch(HttpServletRequest request,HttpServletResponse response,IndexDb indexdb) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<IndexDb> list=service.getIndexDbServer(indexdb, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/indexDbServerSearchs")
	public void indexDbServerSearchs(HttpServletRequest request,HttpServletResponse response,IndexDBServer indexdb) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<IndexDBServer> list=service.getIndexDbServers(indexdb, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/indexDbGroupSearch")
	public void indexDbGroupSearch(HttpServletRequest request,HttpServletResponse response,IndexDBGroup dbGrp) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<IndexDBGroup> list=service.getIndexDbGroup(dbGrp, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/groupMcuServerSearch")
	public void groupMcuServerSearch(HttpServletRequest request,HttpServletResponse response,GroupMcuServers group) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<GroupMcuServers> list=service.getGroupMcuServer(group, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/groupAudioSearch")
	public void groupAudioSearch(HttpServletRequest request,HttpServletResponse response,GroupAudio groupAudio) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<GroupAudio> list=service.getGroupAudio(groupAudio, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/dictionarySearch")
	public void dictionarySearch(HttpServletRequest request,HttpServletResponse response,Dictionary dict) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<Dictionary> list=service.getDictionary(dict, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/selectIndexDb")
	public void selectIndexDb(HttpServletRequest request,HttpServletResponse response,IndexDBServer db) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<IndexDBServer> list=service.selectIndexDb(db, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.setCharacterEncoding("utf-8");
		response.getWriter().printf(result);
		
	}
	
	
	@RequestMapping("/appDetail")
    public String toForm(Model model,HttpServletRequest request){
		return "appDetail";
    	
    }
	@ResponseBody
	@RequestMapping("/deleteApp")
	public String deleteApp(HttpServletRequest request,@RequestParam("appId")int appId){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteApplication(appId);
		return "success";
		
	}
	@ResponseBody
	@RequestMapping("/sendMessage")
	public String send(HttpServletRequest request,@RequestParam("ips")String ips,@RequestParam("msg")String msg,@RequestParam("type")String type){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
	    List<String> list =new ArrayList<String>();
	    if(StringUtils.isNotBlank(ips)){
	    	list.addAll(Arrays.asList(ips.split(",")));
	    }
	    return service.send(list, msg, type);
		
	}
	@ResponseBody
	@RequestMapping("/maxEndUid")
	public String getMaxEndUid(HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String id=service.getMaxEndUid();
		return id;
		
	}
	
}
