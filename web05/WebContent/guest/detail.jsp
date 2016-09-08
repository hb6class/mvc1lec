<%@ page import="com.guest.bean.GuestBean" %>
<%@ page import="com.guest.model.GuestDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	GuestBean bean=null;
	String idx = request.getParameter("idx").trim();
	boolean tf=true;
	for(int i=0; i<idx.length(); i++){
		if((int)idx.charAt(i)>=(int)'0'&&(int)idx.charAt(i)<=(int)'9'){
		}else{tf=false;}
	}
	int sabun = 0;
	if(tf)sabun=Integer.parseInt(idx);
	GuestDao dao = new GuestDao();
	bean = dao.selectOne(sabun);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세페이지</h1>
	<table>
		<tr>
			<td>사번</td>
			<td><%=bean.getSabun() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=bean.getName() %></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=bean.getNalja() %></td>
		</tr>
		<tr>
			<td>금액</td>
			<td><%=bean.getPay() %></td>
		</tr>
	</table>
	<ul>
		<li><a href="update.jsp?idx=<%=bean.getSabun() %>">[수 정]</a></li>
		<li><a href="delete.jsp?idx=<%=bean.getSabun() %>">[삭 제]</a></li>
	</ul>
</body>
</html>







