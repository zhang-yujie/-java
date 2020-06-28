package com.cqut.recruitPortal.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cqut.recruitPortal.dao.CommonDAO;
import com.cqut.recruitPortal.dto.CharacterFunction;
import com.cqut.recruitPortal.dto.OperatorPermission;
import com.cqut.recruitPortal.entity.Operator;
import com.cqut.recruitPortal.entity.OperatorType;

public class CharacterFunctionsService {

	public CommonDAO cd = new CommonDAO();
	
	/**
	* @Title: getPermission 
	* @Description: 查询用户，用户权限 
	* @param operatorCondition 查询用户的查询条件
	* @param currentPage 当前页
	* @param limit 每页显示数据量
	* @param permissionCondition 权限的查询条件
	* @return 
	* @return List<OperatorPermission>
	 */
	public List<CharacterFunction> getPermission(int currentPage,int limit){
		
		String sql = "select * from operatortype ";
	
		sql += " limit ?,?";
		
		int index = (currentPage-1)*limit;
		
		List<Map<String,Object>> list= cd.executeQuery(sql, new Object[]{index,limit});
		System.out.println("operatorType have :" + list.size());
		System.out.println("operatorType have :" + list.get(0).get("name"));
		System.out.println("operatorType have :" + list.get(0).get("operatorTypeID"));
		List<CharacterFunction> result = new ArrayList<CharacterFunction>();
		
		for(Map<String,Object> m:list){
			
			String permissionSql = "select p.modulepermissionID as modulepermissionID, o.operatorTypeID as operatorTypeID,"
					+ "o.`name` as operatorName ," + 
					"f.functionID as functionID,f.functionName as functionName "+
					"from modulepermission as p "+
					"LEFT JOIN functions as f ON p.moduleID = f.functionID LEFT JOIN  "+
					"operatortype as o ON p.operatorTypeID = o.operatorTypeID where p.operatorTypeID =?";
			List<Map<String,Object>> permissionList = cd.executeQuery(permissionSql, 
					new Object[]{Long.parseLong(m.get("operatorTypeID").toString())}
			); 
			
			CharacterFunction op = new CharacterFunction();
			
			OperatorType o = new OperatorType();
			o.setName(m.get("name").toString());
			o.setOperatorTypeID(Long.parseLong(m.get("operatorTypeID").toString()));
			
			op.setOperatorType(o);
			op.setFunction(permissionList);
			result.add(op);
		}
		
		return result;
	}
	
	//查询数量
	public int getTotal(){

		String sql = "select count(*) as count from operatorType ";
		
		List<Map<String,Object>> list = cd.executeQuery(sql, new Object[0]);
		return Integer.parseInt(list.get(0).get("count").toString());
	}
	
}
