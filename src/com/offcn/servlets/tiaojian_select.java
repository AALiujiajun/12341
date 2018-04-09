package com.offcn.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.tools;
@WebServlet(urlPatterns="/tiaojian_select")
public class tiaojian_select extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	List<Map<String,Object>> list = new tools().ti(request,response);
	request.setAttribute("list", list);
	request.getRequestDispatcher("module_user/table.jsp").forward(request, response);
}
}
 