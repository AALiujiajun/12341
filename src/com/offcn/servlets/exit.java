package com.offcn.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.tools;

/**
 * Servlet implementation class exit
 */
@WebServlet(urlPatterns="/exit")
public class exit extends HttpServlet {

@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	tools t=new tools();
	t.deletee(request, response);
	response.sendRedirect("login.jsp");
}
}
