package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;

public class TeacherTeamAdd extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isOK = true;
		
		String name = request.getParameter("name");
		String nameMessage = "";
		
		//验证是否输入了姓名
		if(name==null || name.equals("")){
			isOK = false;
			nameMessage = "姓名不能为空";
		}
		
		
		String account = request.getParameter("teacherAge");
		String accountMessage =  "";
		if(account==null || account.equals("")){
			accountMessage = "教龄不能为空";
			isOK = false;
		}
		
		String content = request.getParameter("content");
		String titleType = request.getParameter("titleType");
		String collega = request.getParameter("collega");
		
		
		if(isOK){
			//保存到数据库
			String insertSql = "insert into teacherteam(name,teachAge,introduce,titletype,collega) values(?,?,?,?,?)";
			int updateCount = cd.executeUpdate(insertSql, new Object[]{name,account,content,titleType,collega});
			//等于1 表示添加成功
			if(updateCount==1){
				//这里设置一个参数表示是由 这个页面 跳转到 OperatorServlet 页面去的。
				request.setAttribute("redirect", "1");
				request.getServletContext().getRequestDispatcher("/admin/TeacherTeamServlet").forward(request, response);
				//response.sendRedirect("/admin/OperatorServlet");
				//return;
			}else{
				request.setAttribute("addMessage", "新增失败");
				request.getServletContext().getRequestDispatcher("/admin/teacherTeamAdd.jsp").forward(request, response);
			}
			
		}else{
			request.setAttribute("name", name);
			request.setAttribute("nameMessage", nameMessage);
			request.setAttribute("account", account);
			request.setAttribute("accountMessage", accountMessage);
			request.getServletContext().getRequestDispatcher("/admin/OperatorInitAdd").forward(request, response);
		}
		
		//通过调用request.getParameterMap() 可以得到浏览器传递的所有参数
		//Map<String,String[]> parameterMap = request.getParameterMap();
		//System.out.println(JSON.toJSONString(parameterMap));
		
	}


}
