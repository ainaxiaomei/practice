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
import com.snail.audio.admin.entity.GroupAudio;
import com.snail.audio.admin.entity.GroupAudioServers;
import com.snail.audio.admin.entity.GroupMcu;
import com.snail.audio.admin.entity.GroupMcuServers;
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
		 service.modifyMcu(mcu);
		 return "success";
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
		service.modifyAudioServer(audio);
		return "success";
	}
	@RequestMapping("/indexDbServerModify")
	@ResponseBody
	public String indexDbServerModify(HttpServletRequest request,IndexDb indexdb) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.modifyIndexDbServer(indexdb);
		return "success";
	}
	@RequestMapping("/groupMcuServerModify")
	@ResponseBody
	public String groupMcuServerModify(HttpServletRequest request,GroupMcuServers groupMcuServer) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.modifyGroupMcuServer(groupMcuServer);
		return "success";
	}
	@RequestMapping("/groupAudioServerModify")
	@ResponseBody
	public String groupAudioServerModify(HttpServletRequest request,GroupAudioServers groupAudioServer) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.modifyGroupAudioServer(groupAudioServer);
		return "success";
	}
	@RequestMapping("/mcuGroupModify")
	@ResponseBody
	public String mcuGroupModify(HttpServletRequest request,GroupMcu groupMcu) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.modifyGroupMcu(groupMcu);
		return "success";
	}
	@RequestMapping("/audioGroupModify")
	@ResponseBody
	public String audioGroupModify(HttpServletRequest request,GroupAudio groupAudio) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.modifyGroupAudio(groupAudio);
		return "success";
	}
	@RequestMapping("/appResModify")
	@ResponseBody
	public String appResModify(HttpServletRequest request,AppResource appRes) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.modifyAppRes(appRes);
		return "success";
	}
	@ResponseBody
	@RequestMapping("/appModify")
	public String appModify(App app,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.ModifyApplication(app);
		return "success";
		
	}
}
