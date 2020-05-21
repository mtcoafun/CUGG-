<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*Cookie信息处理*/
/*清除Cookie*/
if (request.getParameter("isbn")!=null)
{	
		Cookie cookie=new Cookie("ISBN"+request.getParameter("isbn"),"0");	
		cookie.setMaxAge(0);//设定Cookie立即失效
		response.addCookie(cookie);
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
删除图书 ......
</body>
</html>