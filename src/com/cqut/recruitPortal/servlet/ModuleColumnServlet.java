package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.ModuleColumnService;

public class ModuleColumnServlet extends HttpServlet {

	ModuleColumnService service = new ModuleColumnService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestModule = request.getParameter("newModuleID");
		String columnID = request.getParameter("columnID");
		if(requestModule != null) {
			String sql = "select * from moduleColumn where newModuleID =? " ;
			List<Map<String,Object>> list = service.commonDAO.executeQuery(sql, new Object[]{requestModule});
		
			request.setAttribute("list", list);
		}else if(columnID != null) {
			String sql = "select * from moduleColumn where columnID =? " ;
			List<Map<String,Object>> list = service.commonDAO.executeQuery(sql, new Object[]{columnID});
		
			request.setAttribute("list", list);
		}
		else{
			String sql = "select * from moduleColumn" ;
			List<Map<String,Object>> list = service.commonDAO.executeQuery(sql, new Object[0]);
		
			request.setAttribute("list", list);
		}
			
		request.getServletContext().getRequestDispatcher("/admin/moduleColumnList.jsp").forward(request, response);
	}

}
