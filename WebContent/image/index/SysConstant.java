package com.cqut.recruitPortal.servlet;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class SysConstant {
	
	//用户存储用户上传的头像的文件的路径
	public static String HEAD_PATH = "E:\\高级java\\recruitPortal\\WebContent\\image\\head";
	//缓存目录
	public static String UPLOAD_TEMP = "E:\\高级java\\recruitPortal\\WebContent\\image\\temp";  
	
	//栏目：课程成员 图片目录
	public static String COURSE_GROUP_MEMBER="E:\\高级java\\recruitPortal\\WebContent\\image\\CourseMemerPicture";
	
	public static String TEACH_TEAM="E:\\高级java\\recruitPortal\\WebContent\\image\\TeacherPicture";
	
	//资源
	public static String TEACH_RESOURSE="E:\\高级java\\recruitPortal\\WebContent\\image\\resource";
	static {
		File f = new File(HEAD_PATH);
		if(!f.exists()){
			f.mkdirs();
		}
		
		File ft = new File(UPLOAD_TEMP);
		if(!ft.exists()){
			ft.mkdirs();
		}
	}
	
	public static int DEFAULT_PAGE_LIMIT = 10;
	
	private static final String serverName = "recruitPortal";
	
	//找到对于客服机来说Servet的绝对路径
	public static String serverBasePath(HttpServletRequest request){
		return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+serverName;
	}

}
