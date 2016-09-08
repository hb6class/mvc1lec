<%@ page import="com.guest.model.GuestDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String idx = request.getParameter("idx");
	int sabun = Integer.parseInt(idx.trim());
	GuestDao dao = new GuestDao();
	int cnt=dao.deleteOne(sabun); 
	if(cnt>0)response.sendRedirect("list.jsp");
	else response.sendRedirect("detail.jsp?idx="+sabun);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>