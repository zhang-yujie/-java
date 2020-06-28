package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.IntroductionTypeService;
import com.cqut.recruitPortal.service.NewsService;

public class CourseTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
	IntroductionTypeService service = new IntroductionTypeService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	} 


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "select * from introductionType";
		List<Map<String,Object>> list = service.commonDAO.executeQuery(sql, new Object[0]);
		
		request.setAttribute("list", list);
		System.out.println("list size is:" + list.size());
		request.getServletContext().getRequestDispatcher("/admin/courseTypeList.jsp").forward(request, response);
	}

}
