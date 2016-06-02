package com.snail.audio.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.GroupAudio;
import com.snail.audio.admin.entity.GroupAudioServers;
import com.snail.audio.admin.entity.GroupMcu;
import com.snail.audio.admin.entity.GroupMcuServers;
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
	@RequestMapping("/saveAppRes")
	@ResponseBody
	public String saveAppRes(AppResource appRes,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveAppRes(appRes);
		return "success";
		
	}
	@RequestMapping("/saveGroupMcuServer")
	@ResponseBody
	public String saveGroupMcuServer(GroupMcuServers groupMcuSercers,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveGroupMcuServer(groupMcuSercers);
		return "success";
		
	}
	@RequestMapping("/saveGroupAudioServer")
	@ResponseBody
	public String saveGroupAudioServer(GroupAudioServers groupAudioSercers,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveGroupAudioServer(groupAudioSercers);
		return "success";
		
	}
	@RequestMapping("/saveGroupMcu")
	@ResponseBody
	public String saveGroupMcu(GroupMcu groupMcu,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveGroupMcu(groupMcu);
		return "success";
		
	}
	@RequestMapping("/saveGroupAudio")
	@ResponseBody
	public String saveGroupAudio(GroupAudio groupAudio,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveGroupAudio(groupAudio);
		return "success";
		
	}
	@ResponseBody
	@RequestMapping("/saveApp")
	public String saveApp(App app,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.addApplication(app);
		return "success";
		
	}
}
