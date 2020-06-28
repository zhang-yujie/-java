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

public class CGMPhotoServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonDAO cd = new CommonDAO();
		
		String sql = "select * from coursegroupmemberphoto";
		List<Map<String,Object>> list = cd.executeQuery(sql, new Object[0]);
		System.out.println("picture size:" + list.size());
		request.setAttribute("list", list);
		if(request.getParameter("edit") == null) {
			request.getServletContext().getRequestDispatcher("/admin/cGMPhotoList.jsp").forward(request, response);
			return;
		}
			
		else{
			request.getServletContext().getRequestDispatcher("/admin/cGMPhotoEdit.jsp").forward(request, response);
		}
	}

}
