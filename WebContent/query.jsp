

<%@page contentType="text/html" pageEncoding="UTF-8" import= "java.sql.*"%>
<%@include file="bookstoreconn.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>用户数据管理</title>
    </head>
    <body>
        <table border="1" bgcolor="yellow"  align="center">
            <tr>
                <th width="87" align="center">会员ID</th>
                <th width="87" align="center">姓名</th>
                <th width="87" align="center">密码</th>
                 <th width="87" align="center">登录次数</th>
                 <th width="87" align="center">删除</th>
                 <th width="87" align="center">密码重置</th>
            </tr>
            <%

                
              
                String query="SELECT *  FROM buyerinfo";
                ResultSet rs=stmt.executeQuery(query);
		while(rs.next()){
                %>
            <tr>
                <td><%=new String(rs.getString("memberID").getBytes("ISO-8859-1"),"utf-8")%> </td>
                <td><%=rs.getString("membername")%> </td>
                <td><%=rs.getString("pwd")%> </td>
                <td><%=new String(rs.getString("logonTimes").getBytes("ISO-8859-1"),"utf-8")%> </td>
                <td><a href='modify.jsp?id=<%=rs.getString("memberID")%>'>修改</a> </td>
                <td><a href='delete.jsp?id=<%=rs.getString("memberID")%>'>删除</a> </td>
            <td><a href='resetPassword.jsp?id=<%=rs.getString("memberID")%>'>密码重置</a> </td>
            </tr>
             <%}%>
            <%
                rs.close();
                stmt.close();
                con.close();
            %>
       </table>
       <center><a href="deleteAll.jsp">删除全部数据</a></center>
    </body>
</html>
