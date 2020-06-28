package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.IndexService;

/**
 * Servlet implementation class CourseResourse
 */
public class CourseResourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IndexService service = new IndexService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseResourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "select * from courseresourse";
		List<Map<String,Object>> list = service.cd.executeQuery(sql, new Object[0]);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/courseResourse.jsp").forward(request, response);
	}

}
