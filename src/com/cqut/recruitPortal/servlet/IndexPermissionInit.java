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
import com.cqut.recruitPortal.entity.Operator;
import com.cqut.recruitPortal.entity.OperatorType;

public class IndexPermissionInit extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Operator operator = (Operator)request.getSession().getAttribute("loginOperator");
		Long type = operator.getType();
		String sql = "select * from modulePermission where operatorTypeID=?";
		List<Map<String, Object>> list = cd.executeQuery(sql, new Object[]{type});
		
		request.setAttribute("list", list);
		request.getServletContext().getRequestDispatcher("/admin/indexMiddleBody2.jsp").forward(request, response);
	}

}
