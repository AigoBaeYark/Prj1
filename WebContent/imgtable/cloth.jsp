<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<%
			for (int i = 0; i < 6; i++){
				if(i%3==0){	//if 문 안에서는 tr 생성
		%>
		<tr>
			<td>
			<img src="../img/women<%=i %>.jpg" alt="" /> <br />
			Women style<%=i %>
			</td>
			<%
				}else{	//else 문 안에서 tr 없음
			%>
			
			<td>
			<img src="../img/women<%=i %>.jpg" alt="" /> <br />
			Women style<%=i %>
			</td>
			
		
		<%
				}if(i%3==3){
		%>
			</tr>
			
		<%
					
				}
			}
		%>

	</table>


</body>
</html>