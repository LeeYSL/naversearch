<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.tomcat.jni.Buffer"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String clientId ="hVPEuSehqw4ke0yCgOaL";
String clientSecret="uGdJ02YeFf";
StringBuffer xml = new StringBuffer();

try{
	request.setCharacterEncoding("UTF-8");
	String data = "구디아카데미";
	String display="10"; //조회 데이터 건 수
	String start="1";
	int cnt = (Integer.parseInt(start) -1) * Integer.parseInt(display)+1; //1,11
	//web : 2바이트(한글) 코드 회피
	String text = URLEncoder.encode(data, "UTF-8"); //유니코드 값으로 변경
	System.out.print(text);
	String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="
			   + text+"$display="+display+"$start="+cnt; //xml 결과
	URL url = new URL(apiURL);
	HttpURLConnection con = (HttpURLConnection) url.openConnection();
	con.setRequestMethod("GET");
	con.setRequestProperty("X-Naver-Client-Id", clientId);
	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	int responseCode = con.getResponseCode(); //결과 코드
	BufferedReader br;
	if(responseCode == 200) {
		br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
				
	}else { //에러 발생
		br= new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
	}
	String inputLine;
	while((inputLine = br.readLine()) != null) {
		xml.append(inputLine);
	}
	br.close();

}catch(Exception e) {
 System.out.println(e);
}
System.out.println(xml);
%><%=xml.toString() %>
