package com.snail.audio.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.snail.audio.admin.service.IApplicationService;
@Controller
public class DeleteControl {
	@RequestMapping("/mcuServerDelete")
	@ResponseBody
	public String mcuServerDelete(HttpServletRequest request,@RequestParam("serverId") int serverId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteMcu(Integer.valueOf(serverId));
		return "success";
		
		
	}
	@ResponseBody
	@RequestMapping("/gateServerDelete")
	public String gateServerDelete(HttpServletRequest request ,@RequestParam("serverId") int serverId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteGateServer(Integer.valueOf(serverId));
		return "success";
		
		
	}
	@RequestMapping("/audioServerDelete")
	@ResponseBody
	public String audioServerDelete(HttpServletRequest request ,@RequestParam("serverId") int serverId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteAudioServer(Integer.valueOf(serverId));
		return "success";
		
		
	}
	@RequestMapping("/indexDbServerDelete")
	@ResponseBody
	public String indexDbServerDelete(HttpServletRequest request ,@RequestParam("serverId") int serverId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteIndexDbServer(Integer.valueOf(serverId));
		return "success";
		
		
	}
	@RequestMapping("/groupMcuDelete")
	@ResponseBody
	public String groupServerDelete(HttpServletRequest request ,@RequestParam("groupId") int groupId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteGroupMcu(Integer.valueOf(groupId));
		return "success";
		
		
	}
	@RequestMapping("/groupAudioDelete")
	@ResponseBody
	public String groupAudioDelete(HttpServletRequest request ,@RequestParam("groupId") int groupId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteGroupAudio(Integer.valueOf(groupId));
		return "success";
		
		
	}
	@RequestMapping("/groupMcuServerDelete")
	@ResponseBody
	public String groupMcuServerDelete(HttpServletRequest request ,@RequestParam("Id") int Id) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteGroupMcuServer(Integer.valueOf(Id));
		return "success";
		
		
	}
	@RequestMapping("/groupAudioServerDelete")
	@ResponseBody
	public String groupAudioServerDelete(HttpServletRequest request ,@RequestParam("Id") int Id) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteGroupAudioServer(Integer.valueOf(Id));
		return "success";
		
		
	}
	@RequestMapping("/appResDelete")
	@ResponseBody
	public String appResDelete(HttpServletRequest request ,@RequestParam("Id") int id) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteAppRes(id);
		return "success";
		
		
	}
	@RequestMapping("/ftpServerDelete")
	@ResponseBody
	public String ftpServerDelete(HttpServletRequest request ,@RequestParam("serverId") int id) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteFtp(id);
		return "success";
		
		
	}
}
