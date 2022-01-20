<%@page import="customer.vo.Notice"%>
<%@page import="customer.dao.NoticeDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeRegProc</title>
</head>
<body>
	<h3>noticeRegProc.jsp</h3>
	<%
		request.setCharacterEncoding("utf-8");
		/* String title = request.getParameter("title");
		String content = request.getParameter("content");
		//dbconnect
		
		//title과 content 를 set 하고 dao에서 write 한다.
		NoticeDao dao = new NoticeDao();
		Notice n = new Notice();
		n.setTitle(title);
		n.setContent(content);
		
		int af = dao.write(n);
		if(af>0)	//write 가 하나라도 되었으면
			response.sendRedirect("notice.jsp");
		else 		//write 가 안되었으면
			out.write("글쓰기 오류"); */
		
	%>


</body>
</html>