package com.cqut.recruitPortal.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cqut.recruitPortal.dao.CommonDAO;
import com.cqut.recruitPortal.dto.ModuleNewsType;
import com.cqut.recruitPortal.dto.ModuleTypeColumn;

//查询模块中所有的新闻类型
public class ModuleNewsTypeService {
	public CommonDAO commonDAO = new CommonDAO();
	
	public List<ModuleNewsType> pageInit() {

		List<ModuleNewsType> list = new ArrayList<ModuleNewsType>();

		// 查询所有的新闻类型
		String allNewsTypeSql = "select `newModuleID` as newModuleID, `name` as name from newModule";
		List<Map<String, Object>> newsTypeList = commonDAO.executeQuery(allNewsTypeSql, new Object[0]);

		String querysql = "SELECT m.newModuleid as newModuleid,m.`name` as moduleName,t.`name` as typeName,"
				+ "t.newsTypeID as newsTypeID from newmoduletype as n LEFT JOIN newstype as t ON n.newstypeID="
				+ "t.newsTypeID LEFT JOIN newmodule as m on n.newModuleID = m.newModuleid"
				+ " where m.newModuleID=?";

		

		int newsTypeListSize = newsTypeList.size();
		for (int i = 0; i < newsTypeListSize; i++) {
			ModuleNewsType newsType = new ModuleNewsType();

			Map<String, Object> tempMap = newsTypeList.get(i);

			List<Map<String, Object>> news = commonDAO.executeQuery(querysql,new Object[] { tempMap.get("newModuleID")});
			// data.put(newsType, listMap);
			newsType.setName(tempMap.get("name").toString());
			newsType.setNewModuleID(Long.parseLong(tempMap.get("newModuleID").toString()));
			newsType.setModuleColumn(news);
			list.add(newsType);
		}
		return list;
	}
}
