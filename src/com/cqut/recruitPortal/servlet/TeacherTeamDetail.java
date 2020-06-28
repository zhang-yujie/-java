package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;

public class TeacherTeamDetail extends HttpServlet {

	CommonDAO cd = new CommonDAO();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response );
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		System.out.println("operatorID:"+id);
		String queryOperatorSql = "select * from teacherTeam where id=?";
		
		List<Map<String,Object>> listMap = cd.executeQuery(queryOperatorSql, new Object[]{Long.parseLong(id)});
		
		
		if(listMap.size()>0){
			System.out.println(listMap.get(0));
			request.setAttribute("teacher", listMap.get(0));
			request.getServletContext().getRequestDispatcher("/admin/teacherTeamDetail.jsp").forward(request, response);
		}else{
			try {
				throw new Exception("提取用户信息失败");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
