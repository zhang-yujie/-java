package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.IntroductionService;
import com.cqut.recruitPortal.service.NewsService;


public class CourseDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IntroductionService service = new IntroductionService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String courseTypeID = request.getParameter("courseTypeID");
		//查询给定ID的 新闻
		String sql = "select * from Introductions where type=? ";  
		List<Map<String,Object>> listMap = service.commonDAO.executeQuery(sql, new Object[]{Long.parseLong(courseTypeID)});  
		
		if(listMap.size()==1){
			Map<String,Object> news = listMap.get(0);
			
			request.setAttribute("news", news);
		}
		
		request.getServletContext().getRequestDispatcher("/admin/courseDetail.jsp").forward(request, response);
		
	}

}
