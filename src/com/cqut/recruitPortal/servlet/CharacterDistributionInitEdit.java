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

public class CharacterDistributionInitEdit extends HttpServlet {
	CommonDAO cd = new CommonDAO();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operatorID = request.getParameter("id");
		String sql = "select * from operatorType ";
		List<Map<String, Object>> list = cd.executeQuery(sql, new Object[0]);
		
		request.setAttribute("operatorTypeList", list);
		
		String sql2 = "select * from operator where operatorID=?";
		List<Map<String, Object>> list2 = cd.executeQuery(sql2, new Object[]{operatorID});
		request.setAttribute("id", operatorID);
		request.setAttribute("operator", list2.get(0));
		request.setAttribute("type", list2.get(0).get("type"));
		request.getServletContext().getRequestDispatcher("/admin/characterDistributionEdit.jsp").forward(request, response);
		
	}

}
