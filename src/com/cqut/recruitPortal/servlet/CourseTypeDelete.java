package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.IntroductionTypeService;

public class CourseTypeDelete extends HttpServlet {
	IntroductionTypeService service = new IntroductionTypeService();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseTypeID = request.getParameter("courseTypeID");

		int updateCount = service.deleteByID(Long.parseLong(courseTypeID));

		if (updateCount == 1) {
			request.getServletContext().getRequestDispatcher("/admin/CourseTypeServlet").forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.write("删除失败");
			out.flush();
			out.close();
		}

	}

}
