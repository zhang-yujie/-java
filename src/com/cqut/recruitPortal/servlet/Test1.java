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
 * Servlet implementation class Test1
 */
public class Test1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IndexService service = new IndexService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test1() {
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
		String sql1 = "select * from webindexinformation";
		List<Map<String,Object>> name = service.cd.executeQuery(sql1, new Object[0]);
		String sql2 = "select * from links";
		List<Map<String,Object>> links = service.cd.executeQuery(sql2, new Object[0]);
		if(name.size()==1) {
			request.setAttribute("name", name.get(0).get("webName"));
			System.out.println("name = "+name.get(0).get("webName"));
			request.setAttribute("links", links);
			request.getRequestDispatcher("test.jsp").forward(request, response);
		}
		
	}

}
