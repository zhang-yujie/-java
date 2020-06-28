package com.cqut.recruitPortal.dto;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URLConnection;
 
public class testGet {
 
    public static void main(String[] args) throws Exception {
//        URI uri =
//            URI.create("http://www.rainfly.cn/getqq.php?id=1781707873");
//        URLConnection connection = uri.toURL().openConnection();
//        InputStream input = connection.getInputStream();
//        BufferedReader br = new BufferedReader(new InputStreamReader(input, "utf-8"));
//        String line;
//        while ((line = br.readLine()) != null) {
//            System.out.println(line);
//        }
//        input.close();
    	
    	String s = getWebHtml("http://users.qzone.qq.com/fcg-bin/cgi_get_portrait.fcg?uins=1490649571");
    	System.out.print(s);
    	System.out.print("你是真乱码吗");
    }
    
    public static String getWebHtml(String domain) {
    	//	http://www.baidu.com
    	StringBuffer sb = new StringBuffer();
    	InputStream is = null;
    	InputStreamReader isr = null;
    	BufferedReader in = null;
    	try {
    		java.net.URL url = new java.net.URL(domain);
    		is = url.openStream();
    		isr = new InputStreamReader(is,"utf-8");
    		in = new BufferedReader(isr);
    		String line;
    		while ((line = in.readLine()) != null) {
    			sb.append(line).append("\n");
//    				System.out.println(line);
    		}
    		in.close();
    		
    	} catch (IOException e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(in!=null){
    				in.close();
    				in=null;
    			}
    			if(isr!=null){
    				isr.close();
    				isr=null;
    			}
    			if(is!=null){
    				is.close();
    				is=null;
    			}
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	}
    	return sb.toString();
    }

 
}