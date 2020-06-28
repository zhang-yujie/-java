package com.cqut.recruitPortal.entity;

import java.util.List;
import java.util.Map;

import com.cqut.recruitPortal.service.NewsService;

public class test {

	public static void main(String[] args) {
		NewsService service = new NewsService();
		String sql = "select * from introductionType";
		List<Map<String,Object>> news = service.cd.executeQuery(sql, new Object[0]);
		System.out.print(news.get(0));

	}

}
