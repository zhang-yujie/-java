package com.cqut.recruitPortal.servlet;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cqut.recruitPortal.dao.CommonDAO;

public class SysConstant {
	static CommonDAO cd = new CommonDAO();
	//用户存储用户上传的头像的文件的路径
	
	public static String HEAD_PATH = "G:\\3\\新建文件夹 (3)\\recruitPortal\\WebContent\\image\\head";
//	public static String HEAD_PATH = "D:\\recruitPortalFile\\head";
	//缓存目录
	public static String UPLOAD_TEMP = "G:\\3\\新建文件夹 (3)\\recruitPortal\\WebContent\\image\\temp";
//	public static String UPLOAD_TEMP = "D:\\recruitPortalFile\\temp";  
	
	//栏目：课程资成员 图片目录
	public static String COURSE_GROUP_MEMBER= "G:\\3\\新建文件夹 (3)\\recruitPortal\\WebContent\\image\\CourseMemerPicture";
	
	public static String TEACHER_TEAM= "G:\\3\\新建文件夹 (3)\\recruitPortal\\WebContent\\image\\teacherTeam";
	
	public static String TEACH_TEAM="G:\\3\\新建文件夹 (3)\\recruitPortal\\WebContent\\image\\TeacherPicture";
	
	//资源
	public static String TEACH_RESOURSE="G:\\3\\新建文件夹 (3)\\recruitPortal\\WebContent\\image\\resource\\resource";
	
	static {
		File f = new File(HEAD_PATH);
		if(!f.exists()){
			f.mkdirs();
		}
		
		File ft = new File(UPLOAD_TEMP);
		if(!ft.exists()){
			ft.mkdirs();
		}
		
		File cgm = new File(COURSE_GROUP_MEMBER);
		if(!cgm.exists()){
			cgm.mkdirs();
		}
		
		File tt = new File(TEACHER_TEAM);
		if(!tt.exists()){
			tt.mkdirs();
		}
	}
	
	public static int DEFAULT_PAGE_LIMIT = 10;
	
	public static int getRowNumber(Long id){
		String sql = "select * from recordRowNumber where id=?";
		List<Map<String, Object>> row = cd.executeQuery(sql, new Object[]{id});
		return (Integer) row.get(0).get("lineNumber");
	}
	
	private static final String serverName = "recruitPortal";
	
	//找到对于客服机来说Servet的绝对路径
	public static String serverBasePath(HttpServletRequest request){
		return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+serverName;
	}

}
