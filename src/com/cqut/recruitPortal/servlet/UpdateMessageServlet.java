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
 * Servlet implementation class UpdateMessageServlet
 */
public class UpdateMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	IndexService service = new IndexService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id = " + id);
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
		request.getRequestDispatcher("/admin/updateMessage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String questionIDStr = request.getParameter("questionID");
		System.out.println("questionIDStr = "+questionIDStr);
		int questionID = Integer.valueOf(questionIDStr);
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String time = request.getParameter("time");
		
		if(question=="") {
			question = null;
		}
		
		if(answer=="" || answer ==" " ) {
			answer = null;
		}
		if(time == "") {
			time = null;
		}
		int status = 2;
		
		String sql = "";
		int updateCount =0;
		if(time=="" || time==null) {
			sql = "update user set question=?,answer=?,status=? where questionID=?";
			updateCount = service.cd.executeUpdate(sql, new Object[] {question,answer,status,questionID});
		}
		else {
			sql = "update user set question=?,answer=?,time=?,status=? where questionID=?";
			updateCount = service.cd.executeUpdate(sql, new Object[] {question,answer,time,status,questionID});
		}
		System.out.println("time = "+time);
		
		if(updateCount!=1){
//			String addMessage = "新增失败";
			System.out.println("修改失败");
			return;
		}else{
			request.getRequestDispatcher("/admin/MessageManagement").forward(request, response);
			return;
		}
		
	}

}
