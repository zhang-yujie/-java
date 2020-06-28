package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dto.ModuleNewsType;
import com.cqut.recruitPortal.dto.ModuleTypeColumn;
import com.cqut.recruitPortal.service.ModuleNewsTypeService;

public class ModuleNewsTypeServlet extends HttpServlet {
	ModuleNewsTypeService service = new ModuleNewsTypeService();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ModuleNewsType> list = service.pageInit();
		request.setAttribute("list", list);
		String action=request.getParameter("action");
		if(action.equals("1")){
			request.getServletContext().getRequestDispatcher("/admin/courseNavigation2.jsp").forward(request, response);
			return;
		}
		else
			request.getServletContext().getRequestDispatcher("/admin/newExamination2.jsp").forward(request, response);
		
	}
}
