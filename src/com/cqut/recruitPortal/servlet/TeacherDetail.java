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
 * Servlet implementation class TeacherDetail
 */
public class TeacherDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IndexService service = new IndexService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherDetail() {
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
		String id = request.getParameter("id");
		
		String sql = "select * from teacherteam where id=?";
		List<Map<String,Object>> teachers = service.cd.executeQuery(sql, new Object[] {Long.parseLong(id)});
//		System.out.println(teachers.size());
		if(teachers.size()==1) {
			Map<String,Object> teacher = teachers.get(0);
			request.setAttribute("teacher", teacher);
			request.getRequestDispatcher("/teacherDetial.jsp").forward(request, response);
		}else {
			return ;
		}
//		request.setAttribute("teachers", teachers);
		
	}

}
