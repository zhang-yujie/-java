package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;

public class ModuleColumnTypeEdit extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response );
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String columnID = request.getParameter("columnID");
		
		String columnName = request.getParameter("name");
		
		String sql = "update moduleColumn set columnName =? where columnID=?";
		cd.executeUpdate(sql, new Object[]{columnName, columnID});
		System.out.println("this this");
		request.getRequestDispatcher("/admin/ModuleColumnTypeServlet?").forward(request, response);
	}

}
