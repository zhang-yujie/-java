package com.cqut.recruitPortal.dao;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cqut.recruitPortal.entity.QQ;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
/**
 * 根据QQ号码获取QQ信息
 */
public class QQUtil {
    private static String getQQJsonStr(Long qqId) {
        StringBuilder jsonString = new StringBuilder();
        URLConnection connection = null;
        try {
            URL urlObject = new URL("http://users.qzone.qq.com/fcg-bin/cgi_get_portrait.fcg?uins="+qqId);
            connection = urlObject.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(),"GBK"));
            String inputLine = null;
            while ((inputLine = in.readLine()) != null) {
                jsonString.append(inputLine);
            }
            in.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonString.toString().substring("portraitCallBack(".length(),jsonString.length()-1);
    }
    public static QQ getQQInfo(Long qqId) {
        QQ qq = new QQ();
        String jsonString = getQQJsonStr(qqId);
        JSONObject jsonObject = JSON.parseObject(jsonString);
        JSONArray jsonArray = jsonObject.getJSONArray(String.valueOf(qqId));
        qq.setId(qqId);
        qq.setName((String) jsonArray.get(6));
        String pic = "http://q.qlogo.cn/headimg_dl?dst_uin="+qq.getId() + "&spec=100";
        qq.setAvatar(pic);
        return qq;
    }
    public static void main(String args[]) {
    	QQ q = getQQInfo(17817078777L);
    	 System.out.println(q.getId());
        System.out.println(q.getName());
        System.out.println(q.getAvatar());
    }
}