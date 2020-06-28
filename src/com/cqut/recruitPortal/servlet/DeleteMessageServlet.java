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
 * Servlet implementation class DeleteMessageServlet
 */
public class DeleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	IndexService service = new IndexService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String id = request.getParameter("id");
		System.out.println("id = " + id);
		String sql = "delete from user where questionID = ?";
		int updateCount = service.cd.executeUpdate(sql, new Object[] {Integer.valueOf(id)});
		
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
