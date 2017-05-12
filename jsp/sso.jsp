<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html"%>
<%
	String sso = "http://10.10.10.90/st/users/gettoken?web=true&login=http://127.0.0.1:8080/lambo"; 
	String tokenConsumerService = "http://127.0.0.1:8080/lambo/sttokenconsumer";  
	tokenConsumerService = URLEncoder.encode(tokenConsumerService,
			"UTF-8");
	String relayState = (String) request.getAttribute("requestUrl");
	relayState = URLEncoder.encode(relayState, "UTF-8");
	response.sendRedirect(sso + "&" + "tokenConsumerService=" + tokenConsumerService + "&relayState=" + relayState);
	
%>