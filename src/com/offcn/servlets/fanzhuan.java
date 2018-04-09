package com.offcn.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.service.tools;
@WebServlet(urlPatterns="/fanzhuan")
public class fanzhuan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n=new tools().quanxian(request, response);
		request.getRequestDispatcher("user_select").forward(request, response);
	}
}
