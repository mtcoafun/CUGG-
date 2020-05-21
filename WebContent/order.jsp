<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean class="cugg.BookBean" id="bookinfo" scope="page"></jsp:useBean>
    <jsp:useBean id="orderBean" class="cugg.OrderBean" scope="page"></jsp:useBean>
<!DOCTYPE html>
<%
/*禁止使用浏览器Cache，网页立即失效*/
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires",0);
%>
<html>
<head>
<meta charset="UTF-8">
<title>填写订单</title>
</head>
<BODY BGCOLOR="#FFFFFF">
<%
if ("send".equals(request.getParameter("send")))
{	
	//orderBean.setUserID(session.getValue("memberID"));
	String str=request.getParameter("receivername");
	orderBean.setReceiverName(str==null?"":str);
	str=request.getParameter("orderprice");
	orderBean.setOrderprice(str==null?"":str);
	str=request.getParameter("address");
	orderBean.setReceiverAddress(str==null?"":str);
	str=request.getParameter("postcode");
	orderBean.setReceiverZip(str==null?"":str);
	str=request.getParameter("bookinfo");
	orderBean.setBookinfo(str==null?"":str);
	str=request.getParameter("memo");
	//orderBean.setMemo(str==null?"":str);
	
	int orderID=Integer.parseInt(orderBean.getOrderID());
	if (orderID>0)
	{	/*清空Cookie(购物车)信息*/
		Cookie[] cookies=request.getCookies();
		for (int i=0;i<cookies.length;i++)
		{	String isbn=cookies[i].getName();
			if (isbn.startsWith("ISBN")&&isbn.length()==17)
			{	Cookie c=new Cookie(isbn,"0");
				c.setMaxAge(0);//设定Cookie立即失效
				response.addCookie(c);
			}
		}
%> 
<p align="center">订购成功!</p>
<p align="center"> 订单号:<%=orderID%></p>
<p align="center"><a href="booklist.jsp">返回首页</a></p>
<%
	}
	else
	{	
	out.print("订购失败\n");
		
	}
}		

else
{	float price=0;
	String bookInfo="";
	
%> 
<FORM method="post" name="frm">
  <TABLE border="1" width="100%" cellspacing="0" bordercolor="#9999FF">
    <TR>
      <TD width="90">ISBN</TD>
      <TD width="269">书名</TD>
      <TD width="50">单价</TD>
      <TD width="75">数量</TD>
      <TD width="48">价格 </TD>
    </TR>
<%	/*读取购物车信息*/
	Cookie[] cookies=request.getCookies();
	for (int i=0;i<cookies.length;i++)
	{	String isbn=cookies[i].getName();
		String num=cookies[i].getValue();
		if (isbn.startsWith("ISBN")&&isbn.length()==17)
		{	
			bookinfo.setBookISBN(isbn.substring(4,17));
			Float bookPrice = new Float(bookinfo.getPrice());
%>
    <TR>
      <TD width="90"><%= bookinfo.getBookISBN()%></TD>
      <TD width="269"><A href="bookinfo.jsp?isbn=<%= bookinfo.getBookISBN()%>"><%= bookinfo.getBookName()%></A></TD>
      <TD width="50"><%= bookPrice%></TD>
      <TD width="75"> 
        <INPUT size="5" type="text" maxlength="5" value="<%= num%>" name="num" readonly></TD>
      	<TD width="48"><%=  bookPrice.floatValue() * java.lang.Integer.parseInt(num)%></TD>
    </TR>

<%
			price += bookPrice.floatValue()*java.lang.Integer.parseInt(num);
			bookInfo += bookinfo.getBookISBN()+"="+num+";";		
			
		}

	}
%>
</TABLE>
  <p>&nbsp;</p>
  <table width="100%" border="0">
    <tr> 
      <td width="34%">&nbsp;</td>
      <td width="41%">
        <div align="center"><a href="shoppingcart.jsp">修改图书订单</a></div>
      </td>
      <td width="25%">&nbsp;</td>
    </tr>
  </table>
  <p><font color="#0000FF">如以上信息无误，请填写以下信息并按提交按钮提交订单，完成网上订书：</font></p>
  <table width="100%" border="0">
    <tr> 
      <td width="17%"><font color="#0000FF">收书人姓名</font></td>
      <td width="83%"> 
        <input type="text" name="receivername" size="10" maxlength="10">
      </td>
    </tr>
    <tr> 
      <td width="17%"><font color="#0000FF">订单总金额</font></td>
      <td width="83%"> 
        <input type="text" name="orderprice" size="10" value="<%=price%>" readonly>
      </td>
    </tr>
    <tr> 
      <td width="17%"><font color="#0000FF">发送地址</font></td>
      <td width="83%"> 
        <input type="text" name="address" size="60" maxlength="60">
      </td>
    </tr>
    <tr> 
      <td width="17%"><font color="#0000FF">邮编</font></td>
      <td width="83%"> 
        <input type="text" name="postcode" size="6" maxlength="6">
      </td>
    </tr>    
    <tr> 
      <td width="17%"><font color="#0000FF">备注</font></td>
      <td width="83%"> 
        <textarea name="memo" cols="60" rows="6"></textarea>
      </td>
    </tr>
    <tr> 
      <td width="17%"><font color="#0000FF"></font></td>
      <td width="83%"> 
        <input type="submit" name="Submit" value="提交订单">
        <input type="hidden" name="send" value="send">
        <input type="hidden" name="bookInfo" value="<%= bookInfo%>">
      </td>
    </tr>
  </table>
</FORM>
<%
}
%>
</BODY>
</html>