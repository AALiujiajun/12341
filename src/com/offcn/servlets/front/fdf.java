package com.offcn.servlets.front;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class fdf
 */
@WebServlet("/fdf")
public class fdf extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone=request.getParameter("id");
		request.getSession().setAttribute("phone", phone);
		//String code=new SmsUtils().SendSms(phone);
		String code="666666";
		request.getSession().removeAttribute("code");
		request.getSession().setAttribute("code", code);
		response.getWriter().write("ok");
	}

}
