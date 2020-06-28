package com.cqut.recruitPortal.entity;

import java.io.Serializable;

//课程介绍类型
public class IntroductionType implements Serializable{
	private static final long serialVersionUID = 1389357906733L;
	
	private java.lang.Long introductionTypeID;
	
	private java.lang.String name;

	public IntroductionType() {
		super();
	}

	public java.lang.Long getIntroductionTypeID() {
		return introductionTypeID;
	}

	public void setIntroductionTypeID(java.lang.Long introductionTypeID) {
		this.introductionTypeID = introductionTypeID;
	}

	public java.lang.String getName() {
		return name;
	}

	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	
	
}
