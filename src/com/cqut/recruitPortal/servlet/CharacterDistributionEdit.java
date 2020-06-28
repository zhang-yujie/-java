package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.OperatorService;

public class CharacterDistributionEdit extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	OperatorService service  = new OperatorService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isOK = true;
		
		String operatorID = request.getParameter("operatorID");
		System.out.println("operatorID eidt page:"+operatorID);

		String type = request.getParameter("type");
		
		if(isOK){
			String updateSql = "update operator set " +
					"`type`=? " +
					"where `operatorID`=?";
			
			int updateCount = service.cd.executeUpdate(updateSql, new Object[]{type,Long.parseLong(operatorID)});
			//等于1 表示添加成功
			if(updateCount==1){
				//这里设置一个参数表示是由 这个页面 跳转到 OperatorServlet或 OperatorEdit 页面跳转过去的去的。
				request.setAttribute("redirect", "1");
				request.getServletContext().getRequestDispatcher("/admin/CharacterDistribution").forward(request, response);
				//response.sendRedirect("/admin/OperatorServlet");
				//return;
			}else{
				request.setAttribute("addMessage", "编辑失败");
				request.getServletContext().getRequestDispatcher("/admin/CharacterDistributionInitEdit?oid"+operatorID).forward(request, response);
			}
			
		}else{
			request.getServletContext().getRequestDispatcher("/admin/CharacterDistributionInitEdit?oid"+operatorID).forward(request, response);
		}
		
	
		
	}


}
