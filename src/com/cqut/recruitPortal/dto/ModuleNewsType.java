package com.cqut.recruitPortal.dto;

import java.util.List;
import java.util.Map;

//记录一个模块中有哪些新闻类型
public class ModuleNewsType {
private String name;
	
	private java.lang.Long newModuleID;
	
	private List<Map<String,Object>> newsType;

	public ModuleNewsType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public java.lang.Long getNewModuleID() {
		return newModuleID;
	}

	public void setNewModuleID(java.lang.Long newModuleID) {
		this.newModuleID = newModuleID;
	}

	public List<Map<String, Object>> getModuleColumn() {
		return newsType;
	}

	public void setModuleColumn(List<Map<String, Object>> moduleColumn) {
		this.newsType = moduleColumn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
