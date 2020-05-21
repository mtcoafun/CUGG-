<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@include file="bookstoreconn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <jsp:useBean class="cugg.BuyerBean" id="newBuyer" scope="page"></jsp:useBean> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员注册</title>
</head>
<body>
<%
	String no=request.getParameter("newmemberID");
	String name=request.getParameter("newmemberName");
	String pws=request.getParameter("newPws");
	//newBuyer.setMemberID(no);
	//newBuyer.setPwd(pws);
	
	//String sql="select * from buyerinfo where memeberID="+"'"+no+"'";
	//ResultSet rs=stmt.executeQuery(sql);
	//if(rs.next()) response.sendRedirect("addUser.html");
	//else{
	
		String sql1="insert into buyerinfo values('"+no+"','"+name+"','"+pws+"',"+1+")";
		int n=stmt.executeUpdate(sql1);
	    if(n==1) out.print("您已经注册成功！");
	    response.sendRedirect("default.htm");
	//}
%>
</body>
</html>