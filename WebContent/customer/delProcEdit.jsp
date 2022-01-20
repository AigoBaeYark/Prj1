<%@page import="customer.dao.NoticeDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delProcEdit.jsp</title>
</head>
<body>
	<h3>delProcEdit.jsp</h3>
	<%
		String seq = request.getParameter("c");
	
		NoticeDao dao = new NoticeDao();
		int del = dao.delete(seq);
	
		//삭제하는 sql문
		if(del > 0 ){	//무언가 삭제되었다면
			
			response.sendRedirect("notice.do");
		}else{
			out.write("삭제오류");
		}
		
	%>
</body>
</html>