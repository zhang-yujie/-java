package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.QQUtil;
import com.cqut.recruitPortal.entity.QQ;
import com.cqut.recruitPortal.service.IndexService;

/**
 * Servlet implementation class MessageManagement
 */
public class MessageManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IndexService service = new IndexService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String currentPageStr = request.getParameter("currentPage");
		int limit = SysConstant.getRowNumber(1L);
		int currentPage = 1;
		if(currentPageStr!=null && !currentPageStr.equals("")){
			currentPage = Integer.parseInt(currentPageStr);
			if(currentPage<=0){
				currentPage = 1;
			}
		}
		
		int index = (currentPage-1)*limit;
		
		String sql = "select * from user ORDER BY time DESC  limit ?,?";
		List<Map<String, Object>> questions = service.cd.executeQuery(sql, new Object[]{index,limit});
		
		
		
		// 创建分页
		String countSql = "select count(`questionID`) as `count` from user ";
		int count = Integer.parseInt(service.cd.executeQuery(countSql, new Object[0]).get(0).get("count").toString());
		
		
		
		
		String url = "admin/MessageManagement" ;
		String paginationHtml = SysUtil.createPage(count, currentPage, limit, url);
		request.setAttribute("paginationHtml", paginationHtml);

		request.setAttribute("questions", questions);
		request.getRequestDispatcher("/admin/messageManagement.jsp").forward(request, response);
	}

}
