<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sun.javafx.binding.StringFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinProc.jsp</title>
</head>
<body>
	<h3>joinProc.jsp</h3>

	<%
		request.setCharacterEncoding("utf-8");
		System.out.println("iddasdasdasdasdasds");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String IsLunar = request.getParameter("IsLunar");
		String cphone = request.getParameter("cphone");
		String email = request.getParameter("email");
		//String hobby = request.getParameter("hobby"); //여러개 선택하면 제일 앞에 선택한거 하나만 들어감
		String[] hobbies = request.getParameterValues("hobby");
		String habit = "";

		//취미가 하나라도 선택되었으면 for문 실행
		//취미가 하나도 선택되지 않았으면 hobbies==null(else) 이면 아무것도 안함
		if (hobbies != null) {
			
			for (int i = 0; i < hobbies.length; i++) {
				habit += hobbies[i];

				if (hobbies.length > i + 1)
					habit += ",";
			}
		}
		
		List<String> errors = new ArrayList();

		if (id == null || id.equals("")) {//아이디 입력안함
			errors.add("아이디없음");
			System.out.println("id");
		}
		if (pwd != pwd2) { //비밀번호 확인할때 틀림
			errors.add("비밀번호 불일치");
		}
		if (errors.size() > 0) { //에러가 하나라도 있으면 다시 join.jsp로 돌아감
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("join.jsp").forward(request, response);
		} else {

			String birth = String.format("%s-%s-%s", year, month, day);
			String sql = "insert into member values (?,?,?,?,?,?,?,?,?,sysdate)";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String pw = "123456";

			Connection con = DriverManager.getConnection(url, user, pw);

			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, birth);
			pstmt.setString(6, IsLunar);
			pstmt.setString(7, cphone);
			pstmt.setString(8, email);
			pstmt.setString(9, habit);

			pstmt.executeUpdate();

			response.sendRedirect("join.jsp");
		}
	%>

	<%-- <%=id%>
	<br />
	<%=pwd%>
	<br />
	<%=birth%>
	<br />
	<%=gender%>
	<br />
	<%=cphone%>
	<br />
	<%=habit%>
	<br /> --%>


	<%-- <%for(int i=0; i<hobbies.length;i++){ %>
hobby : <%=hobbies[i] %> <br />
<%} %> --%>

</body>
</html>