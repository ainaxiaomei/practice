package com.snail.audio.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.validator.constraints.EAN;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
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
import com.snail.audio.admin.service.IApplicationService;
@Controller
public class ModifyControl {
	@RequestMapping("/mcuServerModify")
	@ResponseBody
	public String mcuServerModify(HttpServletRequest request,McuServer mcu) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		 return service.modifyMcu(mcu);
	}
	@RequestMapping("/gateServerModify")
	@ResponseBody
	public String gateServerModify(HttpServletRequest request,IndexGate gate) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.modifyGate(gate);
		return "success";
	}
	@RequestMapping("/audioServerModify")
	@ResponseBody
	public String audioServerModify(HttpServletRequest request,AudioServer audio) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		return service.modifyAudioServer(audio);
	}
	@RequestMapping("/configServerModify")
	@ResponseBody
	public int configServerModify(HttpServletRequest request,ConfigServer config) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		return service.modifyConfigServer(config);
	}
	@RequestMapping("/indexDbServerModify")
	@ResponseBody
	public String indexDbServerModify(HttpServletRequest request,IndexDb indexdb) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String gateInfo=service.modifyIndexDbServer(indexdb);
		return gateInfo;
	}
	@RequestMapping("/indexDbGroupModify")
	@ResponseBody
	public String indexDbGroupModify(HttpServletRequest request,IndexDBGroup grp) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String gateInfo=service.modifyIndexDbGroup(grp);
		return gateInfo;
	}
	@RequestMapping("/indexDbServersModify")
	@ResponseBody
	public String indexDbServersModify(HttpServletRequest request,IndexDBServer indexdb) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String gateInfo=service.modifyIndexDbServers(indexdb);
		return gateInfo;
	}
	@RequestMapping("/groupMcuServerModify")
	@ResponseBody
	public String groupMcuServerModify(HttpServletRequest request,GroupMcuServers groupMcuServer) throws Exception{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.modifyGroupMcuServer(groupMcuServer);
		return indexDb;
	}
	@RequestMapping("/groupAudioServerModify")
	@ResponseBody
	public String groupAudioServerModify(HttpServletRequest request,GroupAudioServers groupAudioServer) throws Exception{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.modifyGroupAudioServer(groupAudioServer);
		return indexDb;
	}
	@RequestMapping("/mcuGroupModify")
	@ResponseBody
	public String mcuGroupModify(HttpServletRequest request,GroupMcu groupMcu) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.modifyGroupMcu(groupMcu);
		return indexDb;
	}
	@RequestMapping("/audioGroupModify")
	@ResponseBody
	public String audioGroupModify(HttpServletRequest request,GroupAudio groupAudio) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.modifyGroupAudio(groupAudio);
		return indexDb;
	}
	@RequestMapping("/appResModify")
	@ResponseBody
	public String appResModify(HttpServletRequest request,AppResource appRes) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDB=service.modifyAppRes(appRes);
		return indexDB;
	}
	@ResponseBody
	@RequestMapping("/appModify")
	public String appModify(App app,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.ModifyApplication(app);
		return "success";
		
	}
	@ResponseBody
	@RequestMapping("/frpServerModify")
	public String frpServerModify(FTPServer ftp,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.modifyFtp(ftp);
		return "success";
		
	}
	@ResponseBody
	@RequestMapping("/dictionaryModify")
	public String dictionaryModify(Dictionary dict,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String gateInfo=service.modifyDictionary(dict);
		return gateInfo;
		
	}
	@ResponseBody
	@RequestMapping("/deviceModify")
	public String deviceModify(Device device,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String gateInfo =service.modifyDevice(device);
		return gateInfo;
		
	}
}
