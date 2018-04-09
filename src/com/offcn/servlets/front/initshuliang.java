package com.offcn.servlets.front;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.dao.BaseDao;

import net.sf.json.JSONArray;
@WebServlet(urlPatterns="/initshuliang")
public class initshuliang extends HttpServlet {
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String id=request.getParameter("id");
	String sqlchushouzhong="SELECT COUNT(1) AS 'chushouzhong' FROM u_idle_info WHERE fk_fisher="+id+"";
	String sqljiaoyizhuangtai="SELECT COUNT(1) AS 'jiaoyizhuangtai' FROM u_idle_info WHERE transfer_state='ря╫╩рв' and  fk_fisher="+id+"";
	String sqldaifahuo="SELECT COUNT(1) AS 'daifahuo' FROM u_idle_orders WHERE purchaser_id="+id+" AND order_state=0";
	String sqldaishouhuo="SELECT COUNT(1) AS 'daishouhuo' FROM u_idle_orders WHERE purchaser_id="+id+" AND order_state=1";
	String sqlyiqianshou="SELECT COUNT(1) AS 'yiqianshou' FROM u_idle_orders WHERE purchaser_id="+id+" AND order_state=3";
	String chushouzhong=new BaseDao().executeQuery(sqlchushouzhong).get(0).get("chushouzhong").toString();
	String daifahuo=new BaseDao().executeQuery(sqldaifahuo).get(0).get("daifahuo").toString();
	String jiaoyizhuangtai=new BaseDao().executeQuery(sqljiaoyizhuangtai).get(0).get("jiaoyizhuangtai").toString();
	String daishouhuo=new BaseDao().executeQuery(sqldaishouhuo).get(0).get("daishouhuo").toString();
	String yiqianshou=new BaseDao().executeQuery(sqlyiqianshou).get(0).get("yiqianshou").toString();
	Map<String,String> initMaiMap =new HashMap<String, String>();
	initMaiMap.put("chushouzhong", chushouzhong);
	initMaiMap.put("jiaoyizhuangtai", jiaoyizhuangtai);
	initMaiMap.put("daifahuo", daifahuo);
	initMaiMap.put("daishouhuo", daishouhuo);
	initMaiMap.put("yiqianshou", yiqianshou);
	String str=JSONArray.fromObject(initMaiMap).toString();
	response.getWriter().write(str);
}
}
