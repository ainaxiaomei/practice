package com.snail.audio.admin.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.snail.audio.admin.entity.App;
import com.snail.audio.admin.service.IApplicationService;

@Controller
public class BaseControl {
	@RequestMapping("/appList")
    public String toHome(Model model,HttpServletRequest request){
		
		IApplicationService service=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(IApplicationService.class);
		List<App> apps=service.getApplication(0, 5);
		model.addAttribute("apps",apps);
		return "appList";
    	
    }
	@RequestMapping("/appDetail")
    public String toForm(Model model,HttpServletRequest request){
		return "appDetail";
    	
    }
}
