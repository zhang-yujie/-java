package com.cqut.recruitPortal.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cqut.recruitPortal.dao.CommonDAO;
import com.cqut.recruitPortal.dto.ModuleTypeColumn;
import com.cqut.recruitPortal.entity.NewsType;

public class ModuleColumnService {
	public CommonDAO commonDAO = new CommonDAO();
	
	public List<ModuleTypeColumn> pageInit() {

		List<ModuleTypeColumn> list = new ArrayList<ModuleTypeColumn>();

		// 查询所有的新闻类型
		String allNewsTypeSql = "select `newModuleID` as newModuleID, `name` as name from newModule";
		List<Map<String, Object>> newsTypeList = commonDAO.executeQuery(allNewsTypeSql, new Object[0]);

		String querysql = "select * from moduleColumn where newModuleID=?";

		

		int newsTypeListSize = newsTypeList.size();
		for (int i = 0; i < newsTypeListSize; i++) {
			ModuleTypeColumn newsTypeNews = new ModuleTypeColumn();

			Map<String, Object> tempMap = newsTypeList.get(i);

			List<Map<String, Object>> news = commonDAO.executeQuery(querysql,new Object[] { tempMap.get("newModuleID")});
			// data.put(newsType, listMap);
			newsTypeNews.setName(tempMap.get("name").toString());
			newsTypeNews.setNewModuleID(Long.parseLong(tempMap.get("newModuleID").toString()));
			newsTypeNews.setModuleColumn(news);
			list.add(newsTypeNews);
		}
		return list;
	}
}
