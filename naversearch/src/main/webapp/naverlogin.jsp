<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
</head>
<body>
	<%
	String clientId = "Yfxxap44FIeefvHT__bM"; //애플리케이션 클라이언트 아이디값
	String redirectURI = URLEncoder.encode
	          ("http://localhost:8080/naversearch/loginsuccess.jsp", "UTF-8");  
	SecureRandom random = new SecureRandom(); //난수발생기. Random 클래스와 같은 기능
	String state = new BigInteger(130, random).toString(); // BigInteger :문자열 형태로 숫자를 관리
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state; //임의의 수
	session.setAttribute("state", state);
	%>
	<a href="<%=apiURL%>"> <img height="50"
		src="http://static.nid.naver.com/oauth/small_g_in.PNG">
	</a>
</body>
</html>