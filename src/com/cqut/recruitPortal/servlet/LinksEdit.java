package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;

public class LinksEdit extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("linkID");
		String name = request.getParameter("name");
		String link = request.getParameter("link");
		
		String sql = "update links set linkName =?, link=? where linkID=?";
		
		cd.executeUpdate(sql, new Object[]{name, link, id});
		
		request.getServletContext().getRequestDispatcher("/admin/LinksServlet").forward(request, response);
		
	}

}
