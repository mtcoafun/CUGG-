<%@ page  import="java.sql.*"%>
    <%request.setCharacterEncoding("utf-8");
	
		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "812921cqwabc");
		Statement stmt = con.createStatement();
%>