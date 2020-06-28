package com.cqut.recruitPortal.entity;

import java.io.Serializable;

//介绍内容
public class Introductions implements Serializable{
	private static final long serialVersionUID = 1389357906737L;
	
	private java.lang.Long introductionID;
	
	private java.lang.Long type;
	
	private java.lang.String content;

	public java.lang.Long getIntroductionID() {
		return introductionID;
	}

	public void setIntroductionID(java.lang.Long introductionID) {
		this.introductionID = introductionID;
	}

	public java.lang.Long getType() {
		return type;
	}

	public void setType(java.lang.Long type) {
		this.type = type;
	}

	public java.lang.String getContent() {
		return content;
	}

	public void setContent(java.lang.String content) {
		this.content = content;
	}
	
	
}
