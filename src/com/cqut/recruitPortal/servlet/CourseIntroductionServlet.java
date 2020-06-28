package com.cqut.recruitPortal.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cqut.recruitPortal.service.IntroductionTypeService;

/**
 * Servlet implementation class CourseIntroductionServlet
 */
public class CourseIntroductionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
	IntroductionTypeService service = new IntroductionTypeService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseIntroductionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "select * from introductionType";
		List<Map<String,Object>> list = service.commonDAO.executeQuery(sql, new Object[0]);
		
		
		String subColumnSql = "SELECT nmt.newstypeID as introductionTypeID,nt.`name` as `name` " + 
				"from newmoduletype nmt " + 
				"LEFT JOIN newstype nt on nmt.newstypeID=nt.newsTypeID " + 
				"WHERE nmt.newModuleID=?";
		
		List<Map<String,Object>> subList = service.commonDAO.executeQuery(subColumnSql, new Object[]{2});
		List<Object> subListId  = new ArrayList<Object>();
		for(Map<String,Object> subColum:subList) {
			subListId.add(subColum.get("introductionTypeID"));
		}
		
		list.addAll(subList);
		
		request.setAttribute("list", list);
//		System.out.println("list size is:" + list.size());
		
		String Strid = request.getParameter("id");
		
		Long id = 1L;
		
		if(Strid != null) {
			id = (long) Integer.parseInt(Strid);
			System.out.println("存在请求 id:" + id);
		}
			
		else {
			id = (Long) list.get(0).get("introductionTypeID");
			System.out.println("默认ID：" + id);
		}
		String sql2 = "";
		if(subListId.contains(id)) {
			sql2 = "SELECT * from news WHERE type=?";
		}
		else {
			sql2 = "select * from introductions where type=?";
		}
		
		
		List<Map<String,Object>> listMap = service.commonDAO.executeQuery(sql2, new Object[] {id});
		System.out.println("list size = " + listMap.size());
	
		if(listMap.size()==1 && !subListId.contains(id)){
			List<Map<String,Object>> news = new ArrayList<Map<String,Object>>();
			Map<String,Object> n = listMap.get(0);
		
			if(n.get("content") != null) {
				String content = n.get("content").toString();
				content = content.replaceAll(" ", "&nbsp;");
				content = content.replaceAll("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
				content = content.replaceAll("\r\n", "<br/>");
			
				n.put("content", content);
				news.add(n);
			}
//			System.out.println("content = " + news.get("content"));
			
			String sql3 = "select * from introductionType where introductionTypeID=?";
			List<Map<String,Object>> curTypeIntroduction = service.commonDAO.executeQuery(sql3, new Object[] {id});
			request.setAttribute("name", curTypeIntroduction.get(0).get("name"));
			
			request.setAttribute("news", news);
			
			boolean flag = false;
			request.setAttribute("flag", flag);
		}
		else if( subListId.contains(id)) {
			
			List<Map<String,Object>> news = new ArrayList<Map<String,Object>>();
			for(Map<String,Object> n:listMap) {
				Set<String> set = n.keySet();
				
				for(String key:set){
					if(key.equals("publishTime") || key.equals("deadLine")){
						if(n.get(key)!=null){
							//取时间的 yyyy-MM-dd 部分
							n.put(key, SysUtil.formatDate((Date)n.get(key)).substring(0, 10));
//							break;
						}
					}
					else if(key.equals("content") || n.get("content") != null) {
						String content = n.get("content").toString();
						content = content.replaceAll(" ", "&nbsp;");
						content = content.replaceAll("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
						content = content.replaceAll("\r\n", "<br/>");
					
						n.put("content", content);
					}
				}
				news.add(n);
			}
			//获取名字
			String name = "";
			for(Map<String,Object> subColum:subList) {
				if(subColum.get("introductionTypeID").equals(id)) {
					name = (String)subColum.get("name");
				}
			}
			
			request.setAttribute("name", name);
			
			request.setAttribute("news", news);
			boolean flag = true;
			request.setAttribute("flag", flag);
		}
		
		request.getRequestDispatcher("courseIntroduction.jsp").forward(request, response);
	}

}
