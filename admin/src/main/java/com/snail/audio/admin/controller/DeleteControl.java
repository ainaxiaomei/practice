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
	public String mcuServerDelete(HttpServletRequest request,@RequestParam("serverId") int serverId) throws Exception{
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
	@ResponseBody
	@RequestMapping("/configServerDelete")
	public String configServerDelete(HttpServletRequest request ,@RequestParam("serverId") int serverId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteConfigServer(Integer.valueOf(serverId));
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
	@RequestMapping("/indexDbGroupDelete")
	@ResponseBody
	public String indexDbGroupDelete(HttpServletRequest request ,@RequestParam("groupId") int groupId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteIndexDbGroup(Integer.valueOf(groupId));
		return "success";
		
		
	}
	@RequestMapping("/indexDbServersDelete")
	@ResponseBody
	public String indexDbServersDelete(HttpServletRequest request ,@RequestParam("serverId") int serverId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteIndexDbServers(Integer.valueOf(serverId));
		return "success";
		
		
	}
	@RequestMapping("/groupMcuDelete")
	@ResponseBody
	public String groupServerDelete(HttpServletRequest request ,@RequestParam("groupId") int groupId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.deleteGroupMcu(Integer.valueOf(groupId));
		return indexDb;
		
		
	}
	@RequestMapping("/groupAudioDelete")
	@ResponseBody
	public String groupAudioDelete(HttpServletRequest request ,@RequestParam("groupId") int groupId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.deleteGroupAudio(Integer.valueOf(groupId));
		return indexDb;
		
		
	}
	@RequestMapping("/groupMcuServerDelete")
	@ResponseBody
	public String groupMcuServerDelete(HttpServletRequest request ,@RequestParam("Id") int Id,@RequestParam(value="action",required=false) Integer action,@RequestParam(value="groupId",required=false) Integer groupId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.deleteGroupMcuServer(Integer.valueOf(Id),action,groupId);
		return indexDb;
		
		
	}
	@RequestMapping("/groupAudioServerDelete")
	@ResponseBody
	public String groupAudioServerDelete(HttpServletRequest request ,@RequestParam("Id") int Id,@RequestParam(value="action",required=false)Integer action,@RequestParam(value="groupId",required=false)Integer groupId) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.deleteGroupAudioServer(Integer.valueOf(Id),action,groupId);
		return indexDb;
		
		
	}
	@RequestMapping("/appResDelete")
	@ResponseBody
	public String appResDelete(HttpServletRequest request ,@RequestParam("Id") int id) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String indexDb=service.deleteAppRes(id);
		return indexDb;
		
		
	}
	@RequestMapping("/ftpServerDelete")
	@ResponseBody
	public String ftpServerDelete(HttpServletRequest request ,@RequestParam("serverId") int id) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteFtp(id);
		return "success";
		
		
	}
	@RequestMapping("/dictionaryDelete")
	@ResponseBody
	public String dictionaryDelete(HttpServletRequest request ,@RequestParam("key") String key) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		return service.deleteDictionary(key);
		
		
	}
	@RequestMapping("/deviceDelete")
	@ResponseBody
	public String deviceDelete(HttpServletRequest request ,@RequestParam("type") String type) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteDevice(type);
		return "success";
		
		
	}
}
