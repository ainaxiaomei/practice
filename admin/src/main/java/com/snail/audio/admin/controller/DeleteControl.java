package com.snail.audio.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.snail.audio.admin.service.IApplicationService;
@Controller
public class DeleteControl {
	@RequestMapping("/mcuServerDelete")
	public String mcuServerDelete(HttpServletRequest request ) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String serverId=request.getParameter("serverId");
		if(serverId!=null&&!"".equals(serverId)){
			service.deleteMcu(Integer.valueOf(serverId));
			return "mcuServerAdd";
		}else{
			throw new RuntimeException("Server Id "+serverId +" error!");
		}
		
		
	}
	@RequestMapping("/gateServerDelete")
	public String gateServerDelete(HttpServletRequest request ) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String serverId=request.getParameter("serverId");
		if(serverId!=null&&!"".equals(serverId)){
			service.deleteGateServer(Integer.valueOf(serverId));
			return "mcuServerAdd";
		}else{
			throw new RuntimeException("Server Id "+serverId +" error!");
		}
		
		
	}
	@RequestMapping("/audioServerDelete")
	public String audioServerDelete(HttpServletRequest request ) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String serverId=request.getParameter("serverId");
		if(serverId!=null&&!"".equals(serverId)){
			service.deleteAudioServer(Integer.valueOf(serverId));
			return "mcuServerAdd";
		}else{
			throw new RuntimeException("Server Id "+serverId +" error!");
		}
		
		
	}
	@RequestMapping("/indexDbServerDelete")
	public String indexDbServerDelete(HttpServletRequest request ) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		String serverId=request.getParameter("serverId");
		if(serverId!=null&&!"".equals(serverId)){
			service.deleteIndexDbServer(Integer.valueOf(serverId));
			return "mcuServerAdd";
		}else{
			throw new RuntimeException("Server Id "+serverId +" error!");
		}
		
		
	}
}
