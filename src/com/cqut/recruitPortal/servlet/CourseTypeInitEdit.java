package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.entity.IntroductionType;
import com.cqut.recruitPortal.entity.NewsType;
import com.cqut.recruitPortal.service.IntroductionTypeService;

public class CourseTypeInitEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IntroductionTypeService service = new IntroductionTypeService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String introductionID = request.getParameter("courseTypeID");
		System.out.println("ID is :" + introductionID);
		System.out.println("ID is :" );
		IntroductionType introductionType = service.getIntroductionTypeById(Long.parseLong(introductionID));
		System.out.println(introductionType.getName());
		request.setAttribute("introductionType", introductionType);
		request.getServletContext().getRequestDispatcher("/admin/courseTypeEdit.jsp").forward(request, response);
	}

}
