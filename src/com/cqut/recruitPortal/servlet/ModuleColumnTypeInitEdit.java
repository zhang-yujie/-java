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

public class ModuleColumnTypeInitEdit extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String columnID = request.getParameter("columnID");
		
		String sql = "select * from moduleColumn where columnID=?";
		
		List<Map<String, Object>> list = cd.executeQuery(sql, new Object[]{columnID});
		
		request.setAttribute("column", list.get(0));
		request.getServletContext().getRequestDispatcher("/admin/moduleColumnTypeEdit.jsp").forward(request, response);
	}

}
