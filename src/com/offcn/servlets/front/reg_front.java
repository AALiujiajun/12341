package com.offcn.servlets.front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

/**
 * Servlet implementation class reg_front
 */
@WebServlet("/reg_front")
public class reg_front extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone=request.getSession().getAttribute("phone").toString();
		String psw=request.getParameter("psw1");
		String sql="INSERT INTO u_idle_user(u_phonenum,u_password) VALUES('"+phone+"','"+psw+"')";
		int i=new BaseDao().executeUpdate(sql);
		if(i>0)
		{
			request.getRequestDispatcher("front/login.jsp").forward(request, response);
		}
	}

}
