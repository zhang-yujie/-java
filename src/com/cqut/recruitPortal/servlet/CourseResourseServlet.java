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
 * Servlet implementation class CourseResourseServlet
 */
public class CourseResourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IndexService service = new IndexService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseResourseServlet() {
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
		String sql = "select * from courseresoursetype";
		List<Map<String,Object>> list = service.cd.executeQuery(sql, new Object[0]);
		
		request.setAttribute("list", list);
		
//		获取栏目名称
		String Strid = request.getParameter("id");
		
		int id = 0;
		if(Strid != null) {
			id = Integer.parseInt(Strid);
			
			System.out.println("存在请求 id:" + id);
		}
		else {
			id = (Integer) list.get(0).get("type");
			System.out.println("默认ID：" + id);
		}
		
		String sql1 = "select name from courseresoursetype where type=?";
		List<Map<String,Object>> names = service.cd.executeQuery(sql1, new Object[] {id});
		String name = "";
		if(names.size()==1) {
			name = (String)names.get(0).get("name");
		}
		request.setAttribute("name", name);
		
//		获取资源
		String sql2 = "select * from courseresourse";
		List<Map<String,Object>> resourses = service.cd.executeQuery(sql2, new Object[0]);
		request.setAttribute("resourses", resourses);
		
		request.getRequestDispatcher("courseResources.jsp").forward(request, response);
	}

}
