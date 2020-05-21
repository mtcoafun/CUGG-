<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");
	
		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "812921cqwabc");
		Statement stmt = con.createStatement();
		String no=request.getParameter("memberID");
		
		String sql="select * from studentInfo where id="+no;
		ResultSet rs=stmt.executeQuery(sql);		
		if(rs.next()) {
%>		
<form action="modifyCheck.jsp" method="post">
	学号：<input type="text" name="no" readonly="readonly" value='<%=rs.getString("id")%>'><br>
	姓名：<input type="text" name="name" value='<%=rs.getString("name")%>'><br>
	年龄：<input type="text" name="age" value='<%=rs.getString("age")%>'><br>
	密码：<input type="text" name="pws" value='<%=rs.getString("password")%>'><br>
	<input type="submit" value="修改"><br>
</form>


<%}
		
%>
</body>
</html>