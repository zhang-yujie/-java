package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.OperatorTypeService;

/**
 * Servlet implementation class OperatorTypeDelete
 */
public class OperatorTypeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	OperatorTypeService service=  new OperatorTypeService();
	
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
		// TODO Auto-generated method stub
		String operatorTypeID = request.getParameter("operatorTypeID");
		
		int updateCount = service.deleteByID(Long.parseLong(operatorTypeID));
		
		if(updateCount==1){
			request.getServletContext().getRequestDispatcher("/admin/OperatorTypeServlet").forward(request, response);			
		}else{
			PrintWriter out= response.getWriter();
			out.write("删除失败");
			out.flush();
			out.close();
		}
		
		
	}

}
