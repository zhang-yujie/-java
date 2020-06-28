package com.cqut.recruitPortal.dao;

public class QQIsExist {
	public static void main(String[] args) {
		while (true) {
			System.out.println("请输入要查询的QQ号码、输入“0”退出");
			java.util.Scanner in=new java.util.Scanner(System.in);
			String qq = in.next();
			if(qq.equals("0")){
				break;
			}
			String result = "";  
			String charset = "UTF-8";
			String callurl = "http://www.webxml.com.cn/webservices/qqOnlineWebService.asmx/qqCheckOnline?qqCode=";
			try {
				/*
				 * 通过输入QQ号码（String）检测QQ在线状态。 返回数据（String）Y = 在线；N = 离线 ；E =
				 * QQ号码错误
				 */
				java.net.URL url = new java.net.URL(callurl + qq);
				java.net.URLConnection connection = url.openConnection();
				connection.connect();
				java.io.BufferedReader reader = new java.io.BufferedReader(
						new java.io.InputStreamReader(connection
								.getInputStream(), charset));
				String line;
				/*
				 * 返回的格式 <?xml version="1.0" encoding="utf-8"?> <string
				 * xmlns="http://WebXml.com.cn/">E</string>
				 */
				while ((line = reader.readLine()) != null) {
					result += line;
					result += "\n";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			int len = result.indexOf("\">");
			if (len != -1) {
				String qStruts = result.substring(len + 2, len + 3);
				if (qStruts.equals("E")) {
					System.out.println("QQ号码错误");
				} else if (qStruts.equals("Y")) {
					System.out.println("在线");
				} else if (qStruts.equals("N")) {
					System.out.println("离线");
				}
			} else {
				System.out.println("服务器繁忙、请从试!");
			}
		}
	}
}
