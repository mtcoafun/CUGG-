<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <jsp:useBean class="cugg.BookBean" id="book" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>.书店主页.</title>
<SCRIPT language="JavaScript">
<!--
function openwin(str)
{	window.open("addcart.jsp?isbn="+str,  "shoppingcart","width=300,height=200,resizable=1,scrollbars=2");
	return;
}
//-->
</SCRIPT>
</head>
<BODY BGCOLOR="#FFFFFF">
<H1 align="center">拼多多 在线书店首页</H1>
<%  
if (session.getValue("memberID") == null||"".equals(session.getValue("memberID"))){
%>
    <H2 align="center">您需要登录账号,以使用选书功能</H2>
    <H2 align="center"><A href="default.htm">登录</A></H2>
<%
}
else{
%>
<table width="60%" border="1" cellspacing="0" bordercolor="#9999FF" align="center">
  <tr> 
    <td><font color="#3333FF">书名</font></td>
    <td><font color="#3333FF">作者</font></td>
    <td><font color="#3333FF">出版社</font></td>
    <td><font color="#3333FF">定价</font></td>
    <td>&nbsp;</td>
  </tr>
<%
    ResultSet rs = book.getBookList();
    while(rs.next()){
     	String ISBN = rs.getString("bookISBN");
%> 
  <tr> 
    <td><a href="bookinfo.jsp?isbn=
<%= ISBN%>"><%= rs.getString("bookName")%></A></td>
    <td><%= rs.getString("bookAuthor")%></td>
    <td><%= rs.getString("publisher")%></td>
    <td><%= rs.getString("price")%></td>
    <td><a href='Javascript:openwin("<%= ISBN %>")'>加入购物车</a></td>
  </tr>
  <%
   }   
%>   
<br> <br> <br>
<table align="center" bor/table>
  <tbody> 
  <tr> 
    <td><a href="shoppingcart.jsp"><font color="#0000FF" size=7>查看购物车</font></a></td>
    <td></td>
  </tr>
  </tbody> 
</table>
<p>&nbsp;</p>
<%
}
%>
</BODY>
</html>