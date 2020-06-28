package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.IndexService;
import com.sun.org.apache.regexp.internal.RE;

/**
 * Servlet implementation class UpdateResourseServlet
 */
public class UpdateResourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IndexService service = new IndexService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateResourseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idStr = request.getParameter("id");
		Long id = Long.parseLong(idStr);

		String sql = "select * from courseresourse where id=?";
		List<Map<String, Object>> list = service.cd.executeQuery(sql, new Object[] { id });
		if (list.size() == 1) {
			request.setAttribute("source", list.get(0));
			request.getRequestDispatcher("/admin/updatResourse.jsp").forward(request, response);
		} else {
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String sourseID = request.getParameter("sourseID");
		
		String resourse = request.getParameter("resourse");
		
		String[] paths = resourse.split("\\\\");
		int len = paths.length;
//		System.out.println("resourse = "+paths[len-1]);
		String path = "resourse/"+paths[len-1];
		String sql = "update courseresourse set name=?,resourse=? where id=?";
		int count = service.cd.executeUpdate(sql, new Object[] { name,path, Long.parseLong(sourseID) });
		if (count != 0) {
			request.getRequestDispatcher("/admin/CourseResourse").forward(request, response);
		} else {
			return;
		}

	}

}
