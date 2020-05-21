<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean class="cugg.BookBean" id="bookinfo" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书信息</title>
<SCRIPT language="JavaScript">
<!--
function openwin(str)
{	window.open("addcart.jsp?isbn="+str, 
"shoppingcart","width=300,height=200,resizable=1,scrollbars=2");
		return;
}
//-->
</SCRIPT>
</head>
<BODY BGCOLOR="#FFFFFF">
<FORM>
  <%
/*读取购物车信息*/
if (request.getParameter("isbn")!=null)
{	
String isbn = request.getParameter("isbn");	
		bookinfo.setBookISBN(isbn);	
%> 
  <TABLE border="0" width="100%">
    <TBODY> 
    <TR> 
      <TD width="116"><font color="#6600FF">ISBN</font></TD>
      <TD width="349"><font color="#6600FF">
<%= bookinfo.getBookISBN()%></font></TD>
    </TR>
    <TR> 
      <TD width="116"><font color="#6600FF">书名</font></TD>
      <TD width="349"><font color="#6600FF">
<%= bookinfo.getBookName()%></font></TD>
    </TR>
    <TR> 
      <TD width="116"><font color="#6600FF">出版社</font></TD>
      <TD width="349"><font color="#6600FF">
<%= bookinfo.getPublisher()%></font></TD>
    </TR>    
    <TR> 
      <TD width="116"><font color="#6600FF">作者/译者</font></TD>
      <TD width="349"><font color="#6600FF">
<%= bookinfo.getBookAuthor()%></font></TD>
    </TR>
    <TR> 
      <TD width="116"><font color="#6600FF">图书价格</font></TD>
      <TD width="349"><font color="#6600FF">
<%= bookinfo.getPrice()%></font></TD>
    </TR>
    <TR>
      <TD height="18" colspan="3">
        <div align="center"><font color="#6600FF">内容简介</font></div>
      </TD>
    </TR>
    <TR> 
      <TD height="18" colspan="3"> 
        <div align="right"> <br>
          <TEXTAREA rows="10" cols="60" readonly name="content">
<%= bookinfo.getIntroduce()%></TEXTAREA>
        </div>
      </TD>
    </TR>
    </TBODY> 
  </TABLE>
<%
	
}
else
{	out.println("没有该图书数据");
}
%>
</FORM>
<TABLE align="center" border="0">
  <TBODY> 
  <TR>
      
    <TD><a href='Javascript:openwin("<%=request.getParameter("isbn")%>")'>加入购物车</a></TD>
      <TD><A href="shoppingcart.jsp">查看购物车</A></TD>
      <TD><A href="booklist.jsp">返回首页</A></TD>
      <TD></TD>
    </TR>
  </TBODY>
</TABLE>
</BODY>
</html>