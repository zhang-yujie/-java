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
 * Servlet implementation class CourseTeam
 */
public class CourseTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	IndexService service = new IndexService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseTeam() {
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
		String sql = "select * from teacherteam";
		List<Map<String,Object>> teachers = service.cd.executeQuery(sql, new Object[0]);
		System.out.println(teachers.size());
		request.setAttribute("teachers", teachers);
		request.getRequestDispatcher("/courseTeam.jsp").forward(request, response);
	}

}
