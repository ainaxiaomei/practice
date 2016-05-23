package com.snail.audio.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.entity.AppResource;
import com.snail.audio.admin.entity.AudioServer;
import com.snail.audio.admin.entity.FTPServer;
import com.snail.audio.admin.entity.McuServer;
import com.snail.audio.admin.service.IApplicationService;

import net.sf.json.JSONArray;

@Controller
public class BaseControl {
	@RequestMapping("/appList")
    public String toAppList(Model model,HttpServletRequest request){
		
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<App> apps=service.getApplication(0, 5);
		model.addAttribute("apps",apps);
		return "appList";
    	
    }
	@RequestMapping("/mcuServer")
	public String toMCUServer(Model model,HttpServletRequest request){
		
		return "mcuServer";
		
	}
	@RequestMapping("/audioServer")
	public String toAudioServer(Model model,HttpServletRequest request){
		
		return "audioServer";
		
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
	@RequestMapping("/mcuServerAdd")
	public String mcuServerAdd(Model model,HttpServletRequest request){
		
		return "mcuServerAdd";
		
	}
	@RequestMapping("/ftpServerAdd")
	public String toFtpServerAdd(Model model,HttpServletRequest request){
		
		return "ftpServerAdd";
		
	}
	@RequestMapping("/audioServerAdd")
	public String toAudioServerAdd(Model model,HttpServletRequest request){
		
		return "audioServerAdd";
		
	}
	@RequestMapping("/saveMcuServer")
	public String saveMcuServer(McuServer mcu,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.addMcu(mcu);
		return "mcuServerAdd";
		
	}
	@RequestMapping("/saveFtpServer")
	public String saveFtpServer(FTPServer ftp,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveFtp(ftp);
		return "ftpServerAdd";
		
	}
	@RequestMapping("/saveAudioServer")
	public String saveAudioServer(AudioServer audio,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.saveAudioServer(audio);
		return "ftpServerAdd";
		
	}
	@RequestMapping("/audioServerSearch")
	public void audioServerSearch(HttpServletRequest request,HttpServletResponse response,AudioServer audio) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<AudioServer> list=service.getAudioServer(audio,-1,-1);
		//将list转换为json字符创
	    String result =JSONArray.fromObject(list).toString();
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/ftpServerSearch")
	public void ftpServerSearch(HttpServletRequest request,HttpServletResponse response,FTPServer ftp) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<FTPServer> list=service.getFtpServer(ftp,-1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/appResourceSearch")
	public void appResourceSearch(HttpServletRequest request,HttpServletResponse response,AppResource appResource) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<AppResource> list=service.getAppResource(appResource, -1, -1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/mcuServerSearch")
	public void mcuServerSearch(HttpServletRequest request,HttpServletResponse response,McuServer mcu) throws IOException{
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<McuServer> list=service.getMCUServer(mcu,-1,-1);
		//将list转换为json字符创
		String result =JSONArray.fromObject(list).toString();
		response.getWriter().printf(result);
		
	}
	@RequestMapping("/appDetail")
    public String toForm(Model model,HttpServletRequest request){
		return "appDetail";
    	
    }
	@RequestMapping("/modifyApp")
	public String modifyApp(App app,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.ModifyApplication(app);
		return "appDetail";
		
	}
	@RequestMapping("/deleteApp")
	public String deleteApp(App app,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.deleteApplication(app);
		return "appDetail";
		
	}
	@RequestMapping("/saveApp")
	public String saveApp(App app,HttpServletRequest request){
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		service.addApplication(app);
		return "appDetail";
		
	}
}
