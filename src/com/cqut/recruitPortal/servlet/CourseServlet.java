package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.IntroductionService;
import com.cqut.recruitPortal.service.IntroductionTypeService;
import com.cqut.recruitPortal.service.NewsService;

public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
	IntroductionService service = new IntroductionService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	} 


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String introductionTypeID = request.getParameter("introductionTypeID");
		if(introductionTypeID == null) {
			String sql = "select * from introductionType";

			List<Map<String,Object>> list = service.commonDAO.executeQuery(sql, new Object[0]);
			
			request.setAttribute("list", list);
			System.out.println("list size is:" + list.size());
		}else{
			
			String sql = "select * from introductionType where introductionTypeID=?";

			List<Map<String,Object>> list = service.commonDAO.executeQuery(sql, new Object[]{introductionTypeID});
			
			request.setAttribute("list", list);
			System.out.println("list size is:" + list.size());
		}
		
		
		request.getServletContext().getRequestDispatcher("/admin/courseList.jsp").forward(request, response);
	}

}
