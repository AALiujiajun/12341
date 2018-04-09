package com.offcn.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.tools;

/**
 * Servlet implementation class LoginService
 */
@WebServlet(urlPatterns="/LoginService")
public class LoginService extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		tools t=new tools();
		Map<String,Object> map=t.login(request, response);
		if(map!=null)
		{
			request.getSession().setAttribute("map", map);
			request.getRequestDispatcher("index/index.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}

}
