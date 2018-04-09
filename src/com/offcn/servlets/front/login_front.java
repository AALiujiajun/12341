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
@WebServlet(urlPatterns="/login_front")
public class login_front extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username_front");
		String pwd=request.getParameter("pwd_front");
		String sql=" SELECT * FROM u_idle_user WHERE	u_phonenum ="+username+" AND u_password="+pwd+"";
		List<Map<String,Object>> list =new BaseDao().executeQuery(sql);
		if(list!=null&&list.size()>0)
		{
		Map<String,Object> map=list.get(0);
		request.getSession().setAttribute("map_front", map);
		request.getRequestDispatcher("front/index.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("front/login.jsp");
		}
		
}
}
