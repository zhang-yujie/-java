package com.cqut.recruitPortal.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;
import com.cqut.recruitPortal.dao.QQUtil;
import com.cqut.recruitPortal.entity.QQ;

public class CommentSubmit extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("qqID");
		String qqname = request.getParameter("qqname");
		String content = request.getParameter("content");
		Date publishTime = new Date();
		
		QQ qq = QQUtil.getQQInfo(Long.parseLong(id));
		
		String sql = "insert into user(id,name,question,time,status,avatar) values(?,?,?,?,?,?)";
		Object objs[] = {qq.getId(),qq.getName(),content,publishTime,0,qq.getAvatar()};
		
		CommonDAO cd = new CommonDAO();
		cd.executeUpdate(sql, objs);
		request.getServletContext().getRequestDispatcher("/QQDataGet").forward(request, response);
	}

}
