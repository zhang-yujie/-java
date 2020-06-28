package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.entity.Operator;
import com.cqut.recruitPortal.service.IntroductionService;
import com.cqut.recruitPortal.service.NewsService;


public class CourseInitEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IntroductionService service = new IntroductionService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String newsID = request.getParameter("courseTypeID");
		
		//
		String sql = "select * from introductions where type=?";
		List<Map<String,Object>> newsList = service.commonDAO.executeQuery(sql, new Object[]{Long.parseLong(newsID)});
		
		if(newsList.size()>0){
			Map<String,Object> map = newsList.get(0);
			
		
			request.setAttribute("news", map);
			
		}
		
		request.getServletContext().getRequestDispatcher("/admin/courseEdit.jsp").forward(request, response);
		
	}

}
