package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dto.ModuleTypeColumn;
import com.cqut.recruitPortal.dto.NewsTypeNews;
import com.cqut.recruitPortal.service.IntroductionTypeService;
import com.cqut.recruitPortal.service.ModuleColumnService;

public class test222 extends HttpServlet {
	ModuleColumnService service = new ModuleColumnService();
	IntroductionTypeService service2 = new IntroductionTypeService();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ModuleTypeColumn> list = service.pageInit();
		request.setAttribute("list", list);
		
		//介绍的类型
		String sql2 = "select * from introductionType";
		List<Map<String,Object>> list2 = service2.commonDAO.executeQuery(sql2, new Object[0]);
		
		request.setAttribute("list2", list2);
		request.getServletContext().getRequestDispatcher("/admin/columnManagement.jsp").forward(request, response);
	}

}
