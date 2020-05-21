<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
/*Cookie信息处理*/
/*增加Cookie*/
if (request.getParameter("isbn")!=null)
{	Cookie cookie=new Cookie("ISBN"+request.getParameter("isbn"),"1");
	cookie.setMaxAge(30*24*60*60);//设定Cookie有效期限30日
	response.addCookie(cookie);
}
%>
<!DOCTYPE html>
<html>
<head>
<script language="Javascript">
function Timer(){setTimeout("self.close()",10000)}
</script>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta charset="UTF-8">
<title>购物车——CUUG 网上订书系统</title>
</head>
<BODY onload="Timer()">
<table width=100%>
<tr><td align=center>图书已经成功放入购物车！</td></tr>
<tr><td align=center><A href="shoppingcart.jsp" target=resourcewindow>
<font class=font1 color=darkblue>
查看购物车SHOPPING CART</font></A></u></font></td></tr>
<tr><td align=center><a href="order.jsp" target=resourcewindow>
<font class=font1 color=darkblue>
提交定单 ORDER</font></a></u></font></td></tr>
  <tr><td align=center>
<input type="button" value="继续购买" name="B3" 
LANGUAGE="Javascript" onclick="window.close()" 
style="border: #006699 solid 1px;background:#ccCCcc"></td>
  </tr>
 <tr><td align=center>
（此窗口将为您在10秒内自动关闭，您的商品已经安全地保存在购物车中。）
</td></tr>
</table>
</BODY>
</html>