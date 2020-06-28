package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;

public class TeacherTeamServlet extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");  
		String currentPageStr = request.getParameter("currentPage");
		int limit = SysConstant.DEFAULT_PAGE_LIMIT;
		int currentPage = 1;
		if(currentPageStr!=null && !currentPageStr.equals("")){
			currentPage = Integer.parseInt(currentPageStr);
		}
		int index = (currentPage-1)*limit;
		//查询数据的SQL
		String sql = "";
		
		int total = 0;
		//查询总的数据
		String queryTotalSql = ""; 
		//redirect 是由OperatorAdd Servlet在添加人员成功后传递过来的一个参数
		Object redirect = request.getAttribute("redirect");
		
		if(name!=null && !name.equals("")){
			if(request.getMethod().equals("GET")){
				name = new String(name.getBytes("ISO-8859-1"),"UTF-8"); 
			}
		}
		
		if(name==null || name.equals("") || redirect!=null){
			sql = "select * from teacherteam limit ?,?";
			queryTotalSql = "select count(*) as count from teacherteam";
			
			String count = cd.executeQuery(queryTotalSql, new Object[0]).get(0).get("count").toString();
			total = Integer.parseInt(count);
			
			List<Map<String,Object>> listMap =  cd.executeQuery(sql, new Object[]{index,limit});
			request.setAttribute("list", listMap);
			
			System.out.println(Arrays.deepToString(listMap.toArray()));
			
			String url = "admin/TeacherTeamServlet";
			String paginationHtml = SysUtil.createPage(total, currentPage, limit, url);
			request.setAttribute("paginationHtml", paginationHtml);
			
		}else{
			//sql 的模糊查询
			queryTotalSql = "select count(*) as count from teacherteam where name like '%"+name+"%'";
			String count = cd.executeQuery(queryTotalSql, new Object[0]).get(0).get("count").toString();
			total = Integer.parseInt(count);
			
			sql = "select * from teacherteam where name like '%"+name+"%' limit ?,?";
			List<Map<String,Object>> listMap = cd.executeQuery(sql, new Object[]{index,limit});
			request.setAttribute("list", listMap);
			
			String url = "admin/TeacherTeamServlet?name="+name;
			String paginationHtml = SysUtil.createPage(total, currentPage, limit, url);
			request.setAttribute("paginationHtml", paginationHtml);
			
		}
		
		request.setAttribute("name", name);
		
		request.getServletContext().getRequestDispatcher("/admin/teacherTeamList.jsp").forward(request, response);
	}

}
