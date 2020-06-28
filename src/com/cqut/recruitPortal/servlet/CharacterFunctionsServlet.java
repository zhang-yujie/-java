package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dto.CharacterFunction;
import com.cqut.recruitPortal.dto.OperatorPermission;
import com.cqut.recruitPortal.service.CharacterFunctionsService;
import com.cqut.recruitPortal.service.OperatorService;
import com.cqut.recruitPortal.service.PermissionService;

public class CharacterFunctionsServlet extends HttpServlet {

private static final long serialVersionUID = 1L;
	
	CharacterFunctionsService service = new CharacterFunctionsService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentPageStr = request.getParameter("currentPage");
		int limit = SysConstant.DEFAULT_PAGE_LIMIT;
		int currentPage = 1;
		if(currentPageStr!=null && !currentPageStr.equals("")){
			currentPage = Integer.parseInt(currentPageStr);
		}
			
		List<CharacterFunction> list = service.getPermission(currentPage, limit);
		request.setAttribute("list", list);
		
		int total=  service.getTotal();
		String url = "admin/CharacterFunctionsServlet";
		String paginationHtml = SysUtil.createPage(total, currentPage, limit, url);
		request.setAttribute("paginationHtml", paginationHtml);
		request.getServletContext().getRequestDispatcher("/admin/characterFunctionsList.jsp").forward(request, response);
	}

}
