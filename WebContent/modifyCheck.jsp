<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");
	
		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "123456");
		Statement stmt = con.createStatement();
		String no=request.getParameter("no");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String pws=request.getParameter("pws");
		
		 String query1="update studentInfo set name='"+name+"',age="+age+",password='"+pws+"' where id="+no;
		 //System.out.println(query1);
		 int n=stmt.executeUpdate(query1);		 		 
		response.sendRedirect("query.jsp");

	%>
</body>
</html>