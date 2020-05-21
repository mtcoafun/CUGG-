<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*清空Cookie(购物车)信息*/
Cookie[] cookies=request.getCookies();
for (int i=0;i<cookies.length;i++)
{	
String isbn=cookies[i].getName();
		if (isbn.startsWith("ISBN")&&isbn.length()==17)
		{	
			Cookie c=new Cookie(isbn,"0");		
			c.setMaxAge(0);//设定Cookie立即失效
			response.addCookie(c);
		}
}
%>

<!--jsp:forward page="shoppingcart.jsp" /-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="0;URL=shoppingcart.jsp">
<title>Insert title here</title>
</head>
<body>
清空购物车......
</body>
</html>