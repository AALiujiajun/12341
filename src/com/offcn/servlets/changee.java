package com.offcn.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.tools;
@WebServlet(urlPatterns="/changee")
public class changee extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String o=request.getParameter("oxy");
		
		Map<String,Object> map=(Map<String,Object>)request.getSession().getAttribute("map");
	
		String psw=map.get("password")+"";
		String msg="";
		if(o.equals(psw))
		{
			msg="ok";
		}
		else
		{
			msg="error";
		}
		response.getWriter().write(msg);
	}

}
