<%@ page import="java.util.ArrayList" %>
<%@ page import="com.guest.model.GuestDao" %>
<%@ page import="com.guest.bean.GuestBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	GuestDao dao = new GuestDao();
	ArrayList<GuestBean> list = dao.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>GUEST TABLE LIST</h1>
	<table>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>날짜</th>
			<th>금액</th>
		</tr>
		<%
		for(int i=0; i<list.size(); i++){
			GuestBean bean = list.get(i);
		%>
		<tr>
			<td><a href="detail.jsp?idx=<%=bean.getSabun() %>"><%=bean.getSabun() %></a></td>
			<td><%=bean.getName() %></td>
			<td><%=bean.getNalja() %></td>
			<td><%=bean.getPay() %></td>
		</tr>
		<%} %>
	</table>
	<p><a href="insert.jsp">[입 력]</a></p>
</body>
</html>