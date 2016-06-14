package com.snail.audio.admin.exception;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
@Component
public class BaseExceptionHandler implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		if(ex instanceof JSonException) { 
			try {
				response.getWriter().println(ex.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}else{
			try {
				response.getWriter().println(ex.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		
             
	}

}
