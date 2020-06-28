package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.OperatorService;

public class TeacherTeamEdit extends HttpServlet {

private static final long serialVersionUID = 1L;
	
	OperatorService service  = new OperatorService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isOK = true;
		
		String id = request.getParameter("id");
		System.out.println("operatorID eidt page:"+id);
		
		String name = request.getParameter("name");
		String nameMessage = "";
		
		//验证是否输入了姓名
		if(name==null || name.equals("")){
			isOK = false;
			nameMessage = "姓名不能为空";
		}
		
		String teacherAge = request.getParameter("teacherAge");
		String content = request.getParameter("content");
		String titleType = request.getParameter("titleType");
		String collega = request.getParameter("collega");
		
		if(isOK){
			//保存到数据库
			//String insertSql = "insert into operator(`name`,`gender`,`account`,`email`,`type`,`password`) values(?,?,?,?,?,?)";
			
			String updateSql = "update teacherTeam set " +
					"`name`=?, " +
					"`teachAge`=?, " +
					"`introduce`=?, " +
					"`titletype`=?, " +
					"`collega`=? " +
					"where `id`=?";
			
			int updateCount = service.cd.executeUpdate(updateSql, new Object[]{name,teacherAge,content,titleType,collega,Long.parseLong(id)});
			//等于1 表示添加成功
			if(updateCount==1){
				//这里设置一个参数表示是由 这个页面 跳转到 OperatorServlet或 OperatorEdit 页面跳转过去的去的。
				request.setAttribute("redirect", "1");
				request.getServletContext().getRequestDispatcher("/admin/TeacherTeamServlet").forward(request, response);
				//response.sendRedirect("/admin/OperatorServlet");
				//return;
			}else{
				request.setAttribute("addMessage", "编辑失败");
				request.getServletContext().getRequestDispatcher("/admin/TeacherTeamInitEdit?id"+id).forward(request, response);
			}
			
		}else{
			request.setAttribute("nameMessage", nameMessage);
			
			//request.setAttribute("passwordMessage", passwordMessage);
			//request.setAttribute("repasswordMessage", repasswordMessage);
			request.getServletContext().getRequestDispatcher("/admin/TeacherTeamInitEdit?id"+id).forward(request, response);
		}
		
		//通过调用request.getParameterMap() 可以得到浏览器传递的所有参数
		//Map<String,String[]> parameterMap = request.getParameterMap();
		//System.out.println(JSON.toJSONString(parameterMap));
		
	}


}
