package com.cqut.recruitPortal.servlet;

import java.io.IOException;
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
 * Servlet implementation class AddMessageServlet
 */
public class AddMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	IndexService service = new IndexService();
	QQUtil qqUtil = new QQUtil();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMessageServlet() {
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
		String qqId = request.getParameter("qq");
		Long qq = Long.parseLong(qqId);
		String question = request.getParameter("question");
		question = question.replaceAll( "&nbsp;"," ");
		question = question.replaceAll( "&nbsp;&nbsp;&nbsp;&nbsp;","\t");
		question = question.replaceAll( "<br>","\r\n");
		String answer = request.getParameter("answer");
		answer = answer.replaceAll( "<br>"," ");
		String time = request.getParameter("time");
		
		//先看当前qq号码是否已在数据库中
		String sql = "select * from user";
		List<Map<String,Object>> users = service.cd.executeQuery(sql, new Object[0]);
		String name = null;
		String avatar = null;
		for(Map<String,Object> user:users) {
			if(qq == (Long)user.get("id")) {
				name = (String)user.get("name");
				avatar = (String)user.get("vavtar");
				break;
			}
		}
		if(name == null) {
			QQ q = qqUtil.getQQInfo(qq);
			name = q.getName();
			avatar = q.getAvatar();
		}
		if(question=="") {
			question = null;
		}
		if(answer==" ") {
			answer = null;
		}
		if(time=="") {
			time = null;
		}
		if(avatar=="") {
			avatar = null;
		}
		String insertSql = "insert into user(`id`,`name`,`question`,`answer`,`time`,`status`,`avatar`) value(?,?,?,?,?,?,?)";
		int status = 0;
		
		if(answer==" " || answer==null) {
			status = 0;
		}else {
			status = 1;
		}
		Object objs[]={qq,name,question,answer,time,status,avatar};
		int updateCount = service.cd.executeUpdate(insertSql, objs);
		if(updateCount!=1){
//			String addMessage = "新增失败";
			System.out.println("新增失败");
		}else{
			request.getServletContext().getRequestDispatcher("/admin/MessageManagement").forward(request, response);
			return;
		}
		
	}

}
