package com.cqut.recruitPortal.dto;

import java.util.List;
import java.util.Map;

public class ModuleTypeColumn {
	private String name;
	
	private java.lang.Long newModuleID;
	
	private List<Map<String,Object>> moduleColumn;

	public ModuleTypeColumn() {
		super();
	}

	public java.lang.Long getNewModuleID() {
		return newModuleID;
	}

	public void setNewModuleID(java.lang.Long newModuleID) {
		this.newModuleID = newModuleID;
	}

	public List<Map<String, Object>> getModuleColumn() {
		return moduleColumn;
	}

	public void setModuleColumn(List<Map<String, Object>> moduleColumn) {
		this.moduleColumn = moduleColumn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
