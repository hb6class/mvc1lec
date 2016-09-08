<%@ page import="com.guest.model.GuestDao" %>
<%@ page import="com.guest.bean.GuestBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	GuestDao dao = new GuestDao();
	System.out.println(request.getMethod());
	if(request.getMethod().equals("POST")){
		int sabun = Integer.parseInt(request.getParameter("sabun").trim());
		String name = request.getParameter("name").trim();
		int pay = Integer.parseInt(request.getParameter("pay").trim());
		GuestBean bean = new GuestBean();
		bean.setSabun(sabun);
		bean.setName(name);
		bean.setPay(pay);
		int cnt = dao.updateOne(bean); 
		if(cnt>0)response.sendRedirect("list.jsp");
		else response.sendRedirect("detail.jsp?idx="+sabun);
	}else{
		String idx = request.getParameter("idx");
		int sabun = Integer.parseInt(idx);
		GuestBean bean = dao.selectOne(sabun);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>수정페이지</h1>
	<form method="post">
	<table>
		<tr>
			<td>사번</td>
			<td><%=bean.getSabun() %>
			<input type="hidden" name="sabun" value="<%=bean.getSabun() %>">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=bean.getName()%>"></td>
		</tr>
		<tr>
			<td>금액</td>
			<td><input type="text" name="pay" value="<%=bean.getPay()%>"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수 정">
				<input type="reset" value="취 소">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
<%} %>








