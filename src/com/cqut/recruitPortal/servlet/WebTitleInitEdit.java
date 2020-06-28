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

public class WebTitleInitEdit extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "select * from webIndexInformation";
		
		List<Map<String,Object>> list = cd.executeQuery(sql, new Object[0]);
		request.setAttribute("title", list.get(0));
		
		request.getServletContext().getRequestDispatcher("/admin/webTitleEdit.jsp").forward(request, response);
	}

}
