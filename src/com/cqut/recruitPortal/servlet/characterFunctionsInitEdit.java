package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.cqut.recruitPortal.service.CharacterFunctionsService;
import com.cqut.recruitPortal.service.PermissionService;

public class characterFunctionsInitEdit extends HttpServlet {

private static final long serialVersionUID = 1L;
	
	CharacterFunctionsService service = new CharacterFunctionsService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operatorTypeID = request.getParameter("operatorTypeID");
		
		String sql = "select * from operatorType where operatorTypeID=?";
		
		List<Map<String,Object>> operatorList = service.cd.executeQuery(sql, new Object[]{Long.parseLong(operatorTypeID)});
		
		request.setAttribute("operatorType", operatorList.get(0));
		
		//查询该用户已经分配的权限
		String allNewsType = "select `functionID` as functionID, `functionName` as functionName from functions";
		List<Map<String,Object>> allNewsTypeList = service.cd.executeQuery(allNewsType, new Object[0]);
		System.out.println("all:"+JSON.toJSONString(allNewsTypeList));
		
		String operatorPermissionsSql =  "select p.modulepermissionID as modulepermissionID, o.operatorTypeID as operatorTypeID,"
				+ "o.`name` as operatorName ," + 
				"f.functionID as functionID,f.functionName as functionName "+
				"from modulepermission as p "+
				"LEFT JOIN functions as f ON p.moduleID = f.functionID LEFT JOIN  "+
				"operatortype as o ON p.operatorTypeID = o.operatorTypeID where p.operatorTypeID =?";
		List<Map<String,Object>> operatorPermissions = service.cd.executeQuery(operatorPermissionsSql,new Object[]{Long.parseLong(operatorTypeID)});
		System.out.println("op:"+JSON.toJSONString(operatorPermissions));
		
		//生成一组checkbox
		StringBuffer buffer = new StringBuffer();
		int index = 0;
		for(Map<String,Object> m:allNewsTypeList){
			boolean hasFind = false;
			String newsTypeID = m.get("functionID").toString();
			for(int i=0;i<operatorPermissions.size();i++){
				if(operatorPermissions.get(i).get("functionID").toString().equals(newsTypeID)){
					hasFind = true;  
				}
			}
			
			if(hasFind){
				buffer.append("<input type='checkbox' name='type' value='"+newsTypeID+"' id='cb"+index+"' checked='checked'/><label for='cb"+(index++)+"'>"+m.get("functionName")+"</label><br/>");
			}else{
				buffer.append("<input type='checkbox' name='type' value='"+newsTypeID+"' id='cb"+index+"'/><label for='cb"+(index++)+"'>"+m.get("functionName")+"</label><br/>");
			}
		}
		request.setAttribute("allPermission", buffer.toString());
		request.getServletContext().getRequestDispatcher("/admin/characterFunctionEdit.jsp").forward(request, response);
		
	}
}
