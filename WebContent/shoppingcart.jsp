<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="Java" contentType="text/html;charset=gb2312"%>
<jsp:useBean class="cugg.BookBean" id="bookinfo" scope="page"></jsp:useBean>
<%
/*��ֹʹ�������Cache*/
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires",0);
%>
<HTML>
<HEAD>
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>
�鿴���ﳵ -member:<%= session.getValue("memberID") %>
</TITLE>
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<H1 align="center">CUUG ������깺�ﳵ</H1>
<FORM>
  <TABLE border="1" width="100%" cellspacing="0" bordercolor="#9999FF">
    <TR> 
      <TD width="82"><font color="#0000FF">ISBN</font></TD>
      <TD width="258"><font color="#0000FF">����</font></TD>
      <TD width="62"><font color="#0000FF">����</font></TD>
      <TD width="36"><font color="#0000FF">����</font></TD>
      <TD width="43"><font color="#0000FF"> </font></TD>
    </TR>
    <%	
/*��ȡ���ﳵ��Ϣ*/
		Cookie[] cookies=request.getCookies();
		for (int i=0;i<cookies.length;i++)
		{	
			String isbn=cookies[i].getName();
			String num=cookies[i].getValue();
			if (isbn.startsWith("ISBN")&&isbn.length()==17)
			{	
				bookinfo.setBookISBN(isbn.substring(4,17));
		%> 
    <TR> 
      <TD width="82"><%=bookinfo.getBookISBN()%></TD>
      <TD width="258"><A href="bookinfo.jsp?isbn=<%=bookinfo.getBookISBN()%>">
<%= bookinfo.getBookName()%></A></TD>
      <TD width="62"><%= bookinfo.getPrice()%></TD>
      <TD width="36">
        <INPUT size="5" type="text" maxlength="5" value="<%=num%>" 
name="num" readonly>
      </TD>
      <TD width="43"><A href="delbook.jsp?isbn=<%= bookinfo.getBookISBN()%>">
ɾ��</A></TD>
    </TR>
    <%
				}	
	}
%> 
  </TABLE>
<BR>
  <TABLE border="0" width="100%">
    <TBODY> 
    <TR>
      <TD width="19%"><A href="booklist.jsp">������ҳ</A></TD>
      <TD width="24%"><a href="emptycart.jsp">��չ��ﳵ</a></TD>
      <TD width="30%"><a href="order.jsp">��д���ύ����</a></TD>
    </TR>
  </TBODY>
</TABLE>
</FORM>
</BODY>
</HTML>