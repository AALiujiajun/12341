package com.offcn.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;
@WebServlet(urlPatterns="/delete_guan")
public class delete_guan extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String sql="DELETE FROM u_keywords WHERE id ="+id+"";
	int n=new BaseDao().executeUpdate(sql);
	if(n>0)
	{
		String sql2="Select * from u_keywords";
		List<Map<String,Object>> list =new BaseDao().executeQuery(sql2);
		String str=JSONArray.fromObject(list).toString();
		response.getWriter().write(str);
	}
}
}
