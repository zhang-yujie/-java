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

public class RowNumberInitEdit extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		String sql = "select * from recordRowNumber where id=?";
		List<Map<String, Object>> row = cd.executeQuery(sql, new Object[]{Long.parseLong(id)});
		
		request.setAttribute("row", row.get(0));
		
		request.getServletContext().getRequestDispatcher("/admin/rowNumberEdit.jsp").forward(request, response);
	}

}
