package com.snail.audio.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.validator.constraints.EAN;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.snail.audio.admin.entity.AudioServer;
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
}