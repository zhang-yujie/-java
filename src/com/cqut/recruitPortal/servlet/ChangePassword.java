package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;
import com.cqut.recruitPortal.entity.Operator;

public class ChangePassword extends HttpServlet {
	CommonDAO cd = new CommonDAO();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ps = request.getParameter("password");
		String cps = request.getParameter("comfirmPassword");
		
		Long operatorID = ((Operator)request.getSession().getAttribute("loginOperator")).getOperatorID();
		String sql = "update operator set password=? where operatorID =?";
		
		cd.executeUpdate(sql, new Object[]{ps, operatorID});
		
		request.getServletContext().getRequestDispatcher("/admin/index2.jsp").forward(request, response);
	}

}
