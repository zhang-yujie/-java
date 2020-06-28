package com.cqut.recruitPortal.service;

import java.util.List;
import java.util.Map;

import com.cqut.recruitPortal.dao.CommonDAO;
import com.cqut.recruitPortal.entity.IntroductionType;

public class IntroductionTypeService {
	public CommonDAO commonDAO = new CommonDAO();
	
	public IntroductionType getIntroductionTypeById(Long operatorTypeID){
		IntroductionType introductionType = new IntroductionType();
		String sql = "select * from IntroductionType where introductionTypeID=?";
		List<Map<String,Object>> resultlist = commonDAO.executeQuery(sql, new Object[]{operatorTypeID});
		if(resultlist.size()>0){
			Map<String,Object> map = resultlist.get(0);
			introductionType.setIntroductionTypeID(Long.parseLong(map.get("introductionTypeID").toString()));
			introductionType.setName(map.get("name").toString());
			return introductionType;
		}else{
			return null;
		}
	}
	
	public boolean validateNameIsExist(String name){
		String sql = "select count(*) as size from  IntroductionType where name=?";
		List<Map<String,Object>> list = commonDAO.executeQuery(sql, new Object[]{name});
		int size = Integer.parseInt(list.get(0).get("size").toString());
		return size==0 ? false : true;
	}
	
	public int updateById(Long operatorTypeID,String name){
		String sql = "update IntroductionType set name=? where introductionTypeID=?";
		int updateCount = commonDAO.executeUpdate(sql, new Object[]{name,operatorTypeID});
		return updateCount;
	}
	
	public int deleteByID(Long newsTypeID){
		String sql1 = "delete from Introductions where type=?";
		commonDAO.executeUpdate(sql1, new Object[]{newsTypeID});
		String sql = "delete from IntroductionType where introductionTypeID=?";
		int updateCount = commonDAO.executeUpdate(sql, new Object[]{newsTypeID});
		return updateCount;
	}
	
	public int add(String name){
		String sql = "insert into introductionType(name) values(?)";
		int updateCount = commonDAO.executeUpdate(sql, new Object[]{name});
		String sql2 = "select *  from introductionType where name=?";
		List<Map<String,Object>> list = commonDAO.executeQuery(sql2, new Object[]{name});
		Map<String,Object> map = list.get(0);
		String sql3 = "insert into introductions(type) values(?)";
		commonDAO.executeUpdate(sql3, new Object[]{map.get("introductionTypeID") });
		return updateCount; 
	}
}
