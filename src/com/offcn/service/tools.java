package com.offcn.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.offcn.dao.BaseDao;

public class tools {
	public int insert(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name = request.getParameter("name");
		String presentation = request.getParameter("presentation");
		String unit = request.getParameter("unit");
		String amount = request.getParameter("amount");
		String location = request.getParameter("location");
		String purchasing_date = request.getParameter("purchasing_date");
		String original_price = request.getParameter("original_price");
		String transfer_price = request.getParameter("transfer_price");
		String transfer_mode = request.getParameter("transfer_mode");
		String percentage = request.getParameter("percentage");
		String fk_idletype = request.getParameter("fk_idletype");
		String filename=filen(request, response);
		String sql = " INSERT INTO u_idle_info "
				+ " (NAME,idleimg,presentation,unit,amount,location,purchasing_date,original_price,transfer_price,transfer_mode,transfer_state,percentage,fk_idletype,uidle_state,create_date) "
				+ " VALUES " + " ('" + name + "','" + filename + "','" + presentation + "','" + unit + "'," + amount + ",'" + location
				+ "','" + purchasing_date + "'," + original_price + "," + transfer_price + ",'" + transfer_mode
				+ "','未交易','" + percentage + "','" + fk_idletype + "','正常',CURRENT_DATE()) ";
		int n = new BaseDao().executeUpdate(sql);

		return n;
	}
	public String filen(HttpServletRequest request, HttpServletResponse response)
	{
		String filename=null;
		Part part=null;
		try {
			part=request.getPart("idleimg");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SimpleDateFormat si=new SimpleDateFormat("yyyyMMddHHss");
		String str=si.format(new Date());
		String cd = part.getHeader("Content-Disposition");
		String houzhui=cd.substring(cd.lastIndexOf("."),cd.length()-1);
		 filename=str+houzhui;
		 String realPath=request.getServletContext().getRealPath("/idleimg")+"\\"+filename;
		try {
			part.write(realPath);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 return filename;
	}

	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String sql = "SELECT * FROM u_sys_admin WHERE account ='" + account + "' AND PASSWORD ='" + password + "'";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		if (list != null && list.size() > 0) {
			Map<String, Object> map = list.get(0);
			return map;
		} else {
			return null;
		}
	}

	public void deletee(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();

	}

	public List<Map<String, Object>> select() {
		String sql = "Select * from u_idle_info";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		return list;

	}

	public List<Map<String, Object>> user_select() {
		String sql = "Select * from u_idle_user";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		return list;

	}

	public int delete(HttpServletRequest request, HttpServletResponse response) {
		String d = request.getParameter("id");
		String sql = "Delete from u_idle_info where id=" + d + "";
		int n = new BaseDao().executeUpdate(sql);
		return n;
	}

	public List<Map<String, Object>> slike(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String s = request.getParameter("gayname");
		String sql = "Select * from u_idle_info where name like '%" + s + "%'";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		return list;
	}

	public Map<String, Object> upd(HttpServletRequest request, HttpServletResponse response) {
		String na = request.getParameter("suaccount");
		String sql = "Select * from u_sys_admin where account='" + na + "'";
		Map<String, Object> map = new BaseDao().executeQuery(sql).get(0);
		return map;
	}

	public int update(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("suaccount");
		String phone = request.getParameter("suphone");
		String address = request.getParameter("suaddress");
		String mailbox = request.getParameter("suemail");
		String sql = "UPDATE u_sys_admin SET phonenum=" + phone + " ,address='" + address + "',mailbox='" + mailbox
				+ "' where account='" + name + "'";
		int n = new BaseDao().executeUpdate(sql);
		return n;
	}

	public int changepsw(HttpServletRequest request, HttpServletResponse response) {
		String psw = request.getParameter("psw");
		Map<String, Object> map = (Map<String, Object>) request.getSession().getAttribute("map");
		String ds = map.get("id") + "";
		String sql = "UPDATE u_sys_admin SET PASSWORD='" + psw + "' WHERE id='" + ds + "'";
		int n = new BaseDao().executeUpdate(sql);
		return n;
	}

	public int quanxian(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String sql = "UPDATE	u_idle_user SET u_state=  IF(u_state ='正常','锁定','正常') WHERE u_id=" + id + "";
		int n = new BaseDao().executeUpdate(sql);
		return n;
	}

	public List<Map<String, Object>> ti(HttpServletRequest request, HttpServletResponse response) {
		String d = request.getParameter("chaxung");
		String sql = "SELECT * FROM u_idle_user WHERE u_id LIKE '%" + d + "%' OR u_nickname LIKE '%" + d
				+ "%'OR u_state LIKE '%" + d + "%'OR u_province LIKE '%" + d + "%'OR u_city LIKE '%" + d
				+ "%'OR u_district LIKE '%" + d + "%'";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		return list;
	}

	public  List<Map<String,Object>> t()
	{
		String sql="SELECT u_province,COUNT(u_province) AS'cou'  FROM u_idle_user  GROUP BY u_province";
		List<Map<String, Object>> list = new BaseDao().executeQuery(sql);
		return list;

	
	
}
}
