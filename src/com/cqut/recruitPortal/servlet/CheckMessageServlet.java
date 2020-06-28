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
 * Servlet implementation class CheckMessageServlet
 */
public class CheckMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IndexService service = new IndexService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckMessageServlet() {
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
//		System.out.println("id = " + id);
		String sql = "select * from user where questionID = ?";
		List<Map<String,Object>> curUser = service.cd.executeQuery(sql, new Object[] {Integer.valueOf(id)});
		Map<String,Object> c = curUser.get(0);
		if(c.get("question") != null) {
			String content = c.get("question").toString();
			content = content.replaceAll(" ", "&nbsp;");
			content = content.replaceAll("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
			content = content.replaceAll("\r\n", "<br/>");
		
			c.put("content", content);
			
		}
		request.setAttribute("curUser", c);
		
		request.getRequestDispatcher("/admin/checkMessage.jsp").forward(request, response);
	}

}
