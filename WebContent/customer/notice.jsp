<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="customer.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice</title>
</head>
<body>

<style>
	a{
		text-decoration: none;
	}

</style>

	<script>
		function clearVal() {
			var inputVal = document.getElementById("q");
			inputVal.value='';
		}
	</script>


	<form action="notice.do" method="get">
		
		<select name="f" id="">
			<option ${param.f=="title"?"selected" : "" } value="title">제목</option>
			<option ${param.f=="content"?"selected" : "" } value="content">내용</option>
		</select>
		
		<input type="text" name="q" value="${query }" id="q" onclick="clearVal()"/>
		<input type="submit" value="검색"/>
		
	</form>
	
	<h3>Notice.jsp</h3>

	<table width="500" border="1">

		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		

		<%-- <%
			//자바코드사용
			List<Notice> list = (List<Notice>)request.getAttribute("list");
		
			for(Notice n : list){
				pageContext.setAttribute("n2", n);
			
		%> --%>
		
		<c:forEach items="${list }" var = "n2">

			<tr>
				<%-- <td><%=n.getSeq()%></td>
			<!-- notcieDetail.jsp?c= 에서 c가 getParameter 로 받아야 할 이름 -->
			<td><a href="noticeDetail.do?seq=<%=n.getSeq()%> "><%=n.getTitle() %></a></td>
			<td><%=n.getWriter() %></td>
			<td><%=n.getRegdate() %></td>
			<td><%=n.getHit() %></td>  --%>


				<!-- 위에(자바코드 필요)도 되고 아래도 됨 -->
				<td>${n2.seq }</td>
				<!-- notcieDetail.jsp?c= 에서 c가 getParameter 로 받아야 할 이름 -->
				<td><a href="noticeDetail.do?seq=${n2.seq } ">${n2.title }</a></td>
				<td>${n2.writer }</td>
				<td>${n2.regdate }</td>
				<td>${n2.hit }</td>
			</tr>
		</c:forEach>
		
		<%-- <%} %> --%>
		

	</table>
	
	<a href="noticeReg.do">write</a>

</body>
</html>


