package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.entity.Operator;
import com.cqut.recruitPortal.service.IntroductionService;
import com.cqut.recruitPortal.service.NewsService;

/**
 * Servlet implementation class NewsEdit
 */
public class CourseEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IntroductionService service = new IntroductionService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isOK = true;
		
		String newsID = request.getParameter("newsID");
		
		
		
		String content = request.getParameter("content");
		String contentMessage = "";
		if(content==null || content.equals("")){
			isOK = false;
			contentMessage = "内容不能为空";
		}
			
		String addMessage = "";
		if(isOK){
			
			String updateSql = "update introductions set `content`=?where introductionID=?";
			Object objs[]={content,Long.parseLong(newsID)};
			
			int updateCount = service.commonDAO.executeUpdate(updateSql, objs);
			if(updateCount!=1){
				addMessage = "编辑失败";
			}else{
				request.getServletContext().getRequestDispatcher("/admin/CourseServlet").forward(request, response);
				return;
			}
		}
		

		request.setAttribute("contentMessage", contentMessage);
		request.setAttribute("addMessage", addMessage);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("content", content);
		map.put("newsID", newsID);
		
		request.setAttribute("news",map);
		//request.setAttribute("title", title);
		request.getServletContext().getRequestDispatcher("/admin/courseEdit.jsp").forward(request, response);
	}

}
