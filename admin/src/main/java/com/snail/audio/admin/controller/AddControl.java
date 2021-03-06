package com.snail.audio.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

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
import com.snail.audio.admin.service.IApplicationService;

@Controller
public class AddControl {
	@RequestMapping("/saveMcuServer")
	@ResponseBody
	public String saveMcuServer(McuServer mcu,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.addMcu(mcu);
		return "success";
		
	}
	@RequestMapping("/saveFtpServer")
	@ResponseBody
	public String saveFtpServer(FTPServer ftp,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveFtp(ftp);
		return "success";
		
	}
	@RequestMapping("/saveConfigServer")
	@ResponseBody
	public String saveConfigServer(ConfigServer configServer,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveConfigServer(configServer);
		return "success";
		
	}
	@RequestMapping("/saveAudioServer")
	@ResponseBody
	public String saveAudioServer(AudioServer audio,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveAudioServer(audio);
		return "success";
		
	}
	@RequestMapping("/saveGateServer")
	@ResponseBody
	public String saveGateServer(IndexGate gate,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveGateServer(gate);
		return "success";
		
	}
	@RequestMapping("/saveIndexDbServer")
	@ResponseBody
	public String saveIndexDbServer(IndexDb indexdb,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveIndexDbServer(indexdb);
		return "success";
		
	}
	@RequestMapping("/saveIndexDbGroup")
	@ResponseBody
	public String saveIndexDbGroup(IndexDBGroup dbGrp,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveIndexDbGroup(dbGrp);
		return "success";
		
	}
	@RequestMapping("/saveIndexDbServers")
	@ResponseBody
	public String saveIndexDbServers(IndexDBServer indexdb,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveIndexDbServers(indexdb);
		return "success";
		
	}
	@RequestMapping("/saveAppRes")
	@ResponseBody
	public String saveAppRes(AppResource appRes,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDB=service.saveAppRes(appRes);
		return indexDB;
		
	}
	@RequestMapping("/saveGroupMcuServer")
	@ResponseBody
	public String saveGroupMcuServer(GroupMcuServers groupMcuSercers,HttpServletRequest request,@RequestParam(value="action",required=false)Integer action) throws Exception{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.saveGroupMcuServer(groupMcuSercers,action);
		return indexDb;
		
	}
	@RequestMapping("/saveGroupAudioServer")
	@ResponseBody
	public String saveGroupAudioServer(GroupAudioServers groupAudioSercers,HttpServletRequest request,@RequestParam(value="action",required=false)Integer action) throws Exception{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.saveGroupAudioServer(groupAudioSercers,action);
		return indexDb;
		
	}
	@RequestMapping("/saveGroupMcu")
	@ResponseBody
	public String saveGroupMcu(GroupMcu groupMcu,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.saveGroupMcu(groupMcu);
		return indexDb;
		
	}
	@RequestMapping("/saveGroupAudio")
	@ResponseBody
	public String saveGroupAudio(GroupAudio groupAudio,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.saveGroupAudio(groupAudio);
		return indexDb;
		
	}
	@ResponseBody
	@RequestMapping("/saveApp")
	public String saveApp(App app,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.addApplication(app);
		return "success";
		
	}
	@ResponseBody
	@RequestMapping("/companySave")
	public String companySave(Company company,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveCompany(company);
		return "success";
		
	}
	@ResponseBody
	@RequestMapping("/saveDictionary")
	public String saveDictionary(Dictionary dict,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		return service.saveDictionary(dict);
		
	}
	@ResponseBody
	@RequestMapping("/saveDevice")
	public String saveDevice(Device device,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveDevice(device);
		return "success";
		
	}
}
