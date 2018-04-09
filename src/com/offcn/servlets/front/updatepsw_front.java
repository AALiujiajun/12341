package com.offcn.servlets.front;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;
@WebServlet(urlPatterns="/updatepsw_front")
public class updatepsw_front extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Map<String, Object> map = (Map<String, Object>) request.getSession().getAttribute("map_front");
	String ds = map.get("u_phonenum") + "";
	String psw=request.getParameter("psw");
	String sql="UPDATE u_idle_user SET u_password="+psw+" WHERE u_phonenum="+ds+"";
	int n = new BaseDao().executeUpdate(sql);
	if(n>0)
	{
		response.getWriter().write("success");
	}
	else
	{
		response.getWriter().write("error");
	}
}
}
