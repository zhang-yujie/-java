package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.dao.QQUtil;
import com.cqut.recruitPortal.entity.QQ;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class testAjax extends HttpServlet {

	Gson gson = new GsonBuilder()
	         .enableComplexMapKeySerialization() //当Map的key为复杂对象时,需要开启该方法
	         .serializeNulls() //当字段值为空或null时，依然对该字段进行转换
	         .setDateFormat("yyyy-MM-dd HH:mm:ss:SSS") //时间转化为特定格式
	         .disableHtmlEscaping() //防止特殊字符出现乱码
	         .enableComplexMapKeySerialization()
	         .create();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 request.setCharacterEncoding("utf-8");
	        System.out.println(request.getCharacterEncoding());

	        String id = request.getParameter("id");
	        QQ qq = QQUtil.getQQInfo(Long.parseLong(id));
	        
	        System.out.println(qq.getId() + "---" + qq.getAvatar());
	        String json = gson.toJson(qq);

	        response.getWriter().print(json);
	}

}
