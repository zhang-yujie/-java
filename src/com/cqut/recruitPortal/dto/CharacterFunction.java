package com.cqut.recruitPortal.dto;

import java.util.List;
import java.util.Map;

import com.cqut.recruitPortal.entity.OperatorType;

public class CharacterFunction {
	private OperatorType operatorType;
	
	private List<Map<String,Object>> function;

	public CharacterFunction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OperatorType getOperatorType() {
		return operatorType;
	}

	public void setOperatorType(OperatorType operatorType) {
		this.operatorType = operatorType;
	}

	public List<Map<String, Object>> getFunction() {
		return function;
	}

	public void setFunction(List<Map<String, Object>> function) {
		this.function = function;
	}
	
	
}
