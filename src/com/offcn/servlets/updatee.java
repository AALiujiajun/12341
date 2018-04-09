package com.offcn.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;
import com.offcn.service.tools;
@WebServlet(urlPatterns="/updatee")
public class updatee extends HttpServlet {
 @Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	 int n=new tools().update(request, response);
	 Map<String,Object> map=new tools().upd(request, response);
	 request.getSession().setAttribute("map", map);
	 request.getRequestDispatcher("module_center/showup.jsp").forward(request, response);
 }
}
