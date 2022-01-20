<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl5_func</title>
</head>
<body>

	<h2>jstl5_func.jsp</h2>
	
	<c:set var="str1" value=" Functions <태그> 를 사용합니다."></c:set>
	<c:set var="str2" value="사용"></c:set>
	<c:set var="str3" value=" ${fn.trim(str1) }"></c:set>
	<c:set var = "tokens" value="1,2,3,4,5,6,7,8,9,10"></c:set>
	
	length(str1) : ${fn:length(str1) } <br />
	length(str2) : ${fn:length(str2) } <br />
	
	toLowerCase(str1):${fn:toLowerCase(str1) } <br />		<!-- 소문자로 출력 -->
	substring(str1,3,6):${fn:substring(str1,3,6) } <br />	<!-- nct 문자열의 3번째이상 6번쨰미만 -->

	replace(str1,src,dest):${fn:replace(str1," ","_") } <br />	<!-- " " 를 "_" 로 대체 -->
	replace(str1,src,dest):${fn:replace(str1," ","") } <br />	<!-- " " 를 ""로 대체 (띄어쓰기 제거)-->

	indexOf(str1,str2):${fn:indexOf(str1,str2) } <br />	<!-- str2의 문자열을 str1 에서 찾음 '사용' 이 17번째 문자열에서 시작해서 17이 출력 -->
	
	
	
	
</body>
</html>