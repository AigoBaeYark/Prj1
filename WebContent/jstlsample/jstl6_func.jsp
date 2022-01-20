<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl6_func</title>
</head>
<body>

	<h2>jstl6_func.jsp</h2>
	
	<h3>split 사용 예제</h3>
    <c:set var="str1" value="Java|Androrid|Spring|JSP|Servlet" />
    <c:set var="splitStr" value="${fn:split(str1, '|') }" />	<!-- str1의 문자열을 | 기준으로 나눠서 splitStr에 하나씩 넣어줌 -->
    <ul>
        <c:forEach var="str" items="${splitStr }">
            <li>${str }</li>
        </c:forEach>
    </ul>
    <br />
    
    <h3>substring 사용 예제</h3>
    <c:set var="str1" value="Hello, world!" />
    <c:set var="subStr1" value="${fn:substring(str1, 0, 5) }" />
    <c:set var="subStr2" value="${fn:substring(str1, 7, 12) }" />
    <c:out value="subStr1 - ${subStr1 }" />
    <br />
    <c:out value="subStr2 - ${subStr2 }" />
    <br />
    
    <c:set var="str2" value="This is test string." />
 
    <h3>substringAfter 사용 예제</h3>
    <c:set var="subStr1" value="${fn:substringAfter(str2, 'test') }" />
    <c:set var="subStr2" value="${fn:substringAfter(str2, 'This') }" />
    <c:out value="subStr1 - ${subStr1 }" />
    <br />
    <c:out value="subStr2 - ${subStr2 }" />
    <br />
	
	
	<h3>substringBefore 사용 예제</h3>
    <c:set var="subStr1" value="${fn:substringBefore(str2, 'test') }" />
    <c:set var="subStr2" value="${fn:substringBefore(str2, 'This') }" />
    <c:out value="subStr1 - ${subStr1 }" />
    <br />
    <c:out value="subStr2 - ${subStr2 }" />
    <br />
	
	

</body>
</html>