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

/**
 * Servlet implementation class phone_front
 */
@WebServlet("/phone_front")
public class phone_front extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iphone=request.getParameter("iphone");
		String sql="SELECT 1 FROM u_idle_user WHERE u_phonenum ='"+iphone+"'";
		List<Map<String,Object>> list = new BaseDao().executeQuery(sql);
		if(list!=null&&list.size()>0)
		{
			response.getWriter().write("no");
		}
		else
		{
			response.getWriter().write("ok");
		}
	}
}
