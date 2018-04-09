package com.offcn.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.tools;
@WebServlet(urlPatterns="/changpsw")
public class changpsw extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int n=new tools().changepsw(request, response);
	if(n!=0)
	{
		
		response.getWriter().write("success");
	}
	else
	{
		response.getWriter().write("error");
	}
}
}
