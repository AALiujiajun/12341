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
 * Servlet implementation class iphone
 */
@WebServlet("/iphone")
public class iphone extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String sql="SELECT * FROM u_idle_info WHERE name LIKE '%"+id+"%'";
		List<Map<String,Object>> list=new BaseDao().executeQuery(sql);
		request.setAttribute("list_iphone", list);
		request.getRequestDispatcher("front/list.jsp").forward(request, response);
	}

}
