<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean class="cugg.BuyerBean" id="buyer" scope="page"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登录确认页面</title>
</head>
<BODY BGCOLOR="#FFFFFF">
<H1 align="center">CUUG 网上书店</H1>
<%
	String memberID = request.getParameter("memberID");
	String pwd = request.getParameter("pwd");
	buyer.setMemberID(memberID);
	buyer.setPwd(pwd);
%> 
<% 
   int logonTimes = buyer.getLogontimes() ;
   if (logonTimes > 0){
		session.putValue("memberID",memberID);
%>
		<H2 align="center"><%=buyer.getMemberName() %>欢迎你第
<%= logonTimes +1%>次来到CUUG网上书店</H2>
		<H2 align="center"><A href="booklist.jsp">进入书店</A></H2>
<%
   }
   else{
%>
	<H2 align="center">对不起,<%= memberID %>你的用户名和密码有误</H2>
	<H2 align="center"><A href="default.htm">重新登录</A></H2>

<%
   }
%>
   
</BODY>

</html>