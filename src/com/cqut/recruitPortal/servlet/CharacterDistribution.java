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

public class CharacterDistribution extends HttpServlet {
	CommonDAO cd = new CommonDAO();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "select o.operatorID as operatorID,o.`name` as operatorName, "+
				"t.`name` as operatortypeName"+
				" from operator as o LEFT JOIN operatortype as t on o.type = t.operatorTypeID";
		List<Map<String, Object>> list = cd.executeQuery(sql, new Object[0]);
		
		request.setAttribute("list", list);
		
		request.getServletContext().getRequestDispatcher("/admin/characterDistributionList.jsp").forward(request, response);
	}

}
