<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl3_fmt</title>
</head>
<body>

	<h2>jstl3_fmt.jsp</h2>
	number : <fmt:formatNumber value="12345678" type="number"></fmt:formatNumber>	<br /> <!-- 일반적인 숫자 3자리마다 , 온다 -->
	currency : <fmt:formatNumber value="12345678" type="currency" currencySymbol="￦"></fmt:formatNumber>	<br /> <!-- 재화 나타내기 심볼로  ￦줬음, number와 마찬가지로 3자리마다 , 옴-->
	percent : <fmt:formatNumber value="12345678" type="percent"></fmt:formatNumber>	<br /> <!-- 뒤에 % 붙음 number와 마찬가지로 3자리마다 , 옴 -->
	pattern : <fmt:formatNumber value="12345678" pattern=".0"></fmt:formatNumber>  <!-- 맨뒤에 .0붙음 이거는 , 안붙음 -->
	<br />
	
	<c:set var="now" value="<%=new Date() %>"/>
	${now } <br />
		
	date : <fmt:formatDate value="${now }" type="date"/>	<!-- 현재날짜 -->
	time : <fmt:formatDate value="${now }" type="time"/>	<!-- 현재시간 -->
	both : <fmt:formatDate value="${now }" type="both"/>	<!-- 현재날짜와 시간 -->
	
	

</body>
</html>