package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.CommonDAO;
import com.cqut.recruitPortal.dao.QQUtil;
import com.cqut.recruitPortal.entity.QQ;

public class QQDataGet extends HttpServlet {
	CommonDAO cd = new CommonDAO();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id != null) {
			System.out.println("qq为:" + id);
			QQ qq = QQUtil.getQQInfo(Long.parseLong(id));
			request.setAttribute("qq", qq);
		}
		
		String currentPageStr = request.getParameter("currentPage");
		int limit = SysConstant.DEFAULT_PAGE_LIMIT;
		int currentPage = 1;
		if(currentPageStr!=null && !currentPageStr.equals("")){
			currentPage = Integer.parseInt(currentPageStr);
			if(currentPage<=0){
				currentPage = 1;
			}
		}
		
		int index = (currentPage-1)*limit;
		
		String sql = "select * from user where status !=0 ORDER BY time DESC limit ?,?";
		CommonDAO cd = new CommonDAO();
		List<Map<String, Object>> list = cd.executeQuery(sql, new Object[]{index,limit});
		request.setAttribute("list", list);
		System.out.println("留言条数:" + list.size());
		System.out.println(list.get(0).get("avatar"));
		
		String countSql = "select count(`questionID`) as `count` from user where status!= 0";
		int count = Integer.parseInt(cd.executeQuery(countSql, new Object[0]).get(0).get("count").toString()); 
		
		String url = "QQDataGet?";
		String paginationHtml = SysUtil.createPage(count, currentPage, limit, url);
		request.setAttribute("paginationHtml", paginationHtml);
		if(id != null) {
			request.getServletContext().getRequestDispatcher("/questionsAndAnswers.jsp?#aa").forward(request, response);
			return;
		}
		request.getServletContext().getRequestDispatcher("/questionsAndAnswers.jsp").forward(request, response);
	}

}
