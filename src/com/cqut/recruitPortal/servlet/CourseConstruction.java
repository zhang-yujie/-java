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
 * Servlet implementation class CourseConstruction
 */
public class CourseConstruction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	IndexService service = new IndexService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseConstruction() {
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
		String moduelId = request.getParameter("moduelId");
		
		String sql = "select nmt.newModuleID modelID, " + 
				"nmt.newstypeID newsTypeID, " + 
				"nt.name name, " + 
				"n.content content " + 
				"from newmoduletype nmt  " + 
				"LEFT JOIN newstype nt  " + 
				"LEFT JOIN news n ON n.type=nt.newsTypeID " + 
				"ON nmt.newstypeID=nt.newsTypeID " + 
				"where nmt.newModuleID=?";
		List<Map<String,Object>> list = service.cd.executeQuery(sql, new Object[] {Integer.valueOf(moduelId)});
		if(list.size()==1) {
			Map<String,Object> c = list.get(0);
			if(c.get("content") != null) {
				String content = c.get("content").toString();
				content = content.replaceAll(" ", "&nbsp;");
				content = content.replaceAll("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
				content = content.replaceAll("\r\n", "<br/>");
			
				c.put("content", content);
				
			}
			request.setAttribute("content", c.get("content"));
			request.getRequestDispatcher("/courseConstruction.jsp").forward(request, response);
		}else {
			return ;
		}
	}

}
