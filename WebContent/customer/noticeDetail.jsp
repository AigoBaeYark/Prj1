<%@page import="customer.dao.NoticeDao"%>
<%@page import="customer.vo.Notice"%>
<%@page import="java.io.Console"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notcieDetail.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
	<h5>notcieDetail.jsp</h5>

	<%
		//notcieDetail.jsp?c= 라고 되어있어서 c로 받음
		//dao로 seq 넣음
		
		//controller에서 request를 받아서 사용, 밑의 코드는 주석
		/* String seq = request.getParameter("c");
		NoticeDao dao = new NoticeDao();
		Notice n = dao.getNotice(seq);	 */
		
		
		
		
	%>
	
	
	<table class="twidth">
		<colgroup>
		
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		
		</colgroup>
		<caption>Detail</caption>
		<tbody>
			<tr>
				<!-- Notice.java의 변수명과 똑같음 -->
				<th class="left">글번호</th>
				<td>${n.seq }</td> <%-- <td><%=n.getSeq() %></td> --%> 
				<th class="left">조회수</th>
				<td>${n.hit }</td>
			</tr>
			
			<tr>
				<th class="left">작성자</th>
				<td>${n.writer }</td>
				<th class="left">작성시간</th>
				<td>${n.regdate }</td>
			</tr>
			
			<tr>
				<th class="left">제목</th>
				<td colspan="3">${n.title }</td>
				
			</tr>
			
			<tr>
				<th class="left">내용</th>
				<td colspan="3" id="content">${n.content }</td>
				
			</tr>
			
			<tr>
				<th class="left">첨부</th>
				<td colspan="3" id="addfile">첨부</td>
				
			</tr>
			
		</tbody>
	
	</table>
	
	<a href="noticeEdit.do?seq=${n.seq }">수정</a>
	<a href="delProcEdit.do?seq=${n.seq }">삭제</a>
	<a href="notice.do">목록</a>


</body>
</html>

<%
	/* rs.close();
	st.close();
	con.close(); */
%>