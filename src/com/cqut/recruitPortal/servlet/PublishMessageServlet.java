package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;

public class PublishMessageServlet extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "update user set status=1 where questionID =?";
		cd.executeUpdate(sql, new Object[]{id});
		
		request.getServletContext().getRequestDispatcher("/admin/MessageManagement").forward(request, response);
	}

}
