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

public class ModuleColumnInitEdit extends HttpServlet {


	ModuleColumnService service = new ModuleColumnService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestModule = request.getParameter("newModuleID");
		String sql = "select * from moduleColumn where columnID =? " ;
		List<Map<String,Object>> list = service.commonDAO.executeQuery(sql, new Object[]{requestModule});
	
		if(list.size()>0){
			Map<String,Object> map = list.get(0);
			
		
			request.setAttribute("news", map);
			
		}
		request.getServletContext().getRequestDispatcher("/admin/moduleColumnEdit.jsp").forward(request, response);
	}


}
