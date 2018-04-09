package com.offcn.servlets.front;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;
@WebServlet(urlPatterns="/check_front")
public class check_front extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String jj=request.getParameter("oxy");
	String sql="Select * from u_idle_user where u_password="+jj+"";
	List<Map<String,Object>> list=new BaseDao().executeQuery(sql);
	if(list.size()>0)
	{
		response.getWriter().write("ok");
	}
	else
	{
		response.getWriter().write("no");
	}
	
}
}