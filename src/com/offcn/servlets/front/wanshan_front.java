package com.offcn.servlets.front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;
import com.offcn.service.tools;
@WebServlet(urlPatterns="/wanshan_front")
@MultipartConfig
public class wanshan_front extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String front_namee=request.getParameter("front_namee");
		String nickname=request.getParameter("front_nicknamee");
		String province=request.getParameter("front_provincee");
		String city=request.getParameter("front_cityy");
		String district=request.getParameter("front_districtt");
		String filename=new tools().filen(request,response);
		String sql="UPDATE  u_idle_user SET u_nickname='"+nickname+"' , u_province='"+province+"',u_city='"+city+"',u_district='"+district+"',u_headimg='"+filename+"' WHERE u_account='"+front_namee+"'";
		new BaseDao().executeUpdate(sql);
		request.getRequestDispatcher("front/wanshan.jsp").forward(request, response);
}
}
