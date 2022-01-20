<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Connection con = DriverManager.getConnection(url, user, pw);

		String sql = "select pwd from member where id = ?";

		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, id);

		ResultSet rs = pstmt.executeQuery();

		String ypass = "";
		int x = -1;
		String msg = "";

		if (rs.next()) {
			ypass = rs.getString("pwd"); //db에 있는 pwd 가져옴
			if (ypass.equals(pass)) //입력한 비밀번호와 db에 있는 비밀번호 일치 (로그인 성공)
				x = 1; //로그인 성공

			else //로그인 실패	
				x = 0; //비밀번호 불일치
		} else { //입력한 id가 db에 존재하지 않을 때
			x = -1; //db에 존재하지 않는 id
		}
		System.out.println("xxxxxx : " + x);
		if (x == 1) {
			session.setAttribute("sessionID", id);

			msg = "../mainForm.jsp";
		} else if (x == 0) {
			msg = "loginForm.jsp?msg=0";
		} else {
			msg = "loginForm.jsp?msg=-1";
		}
		response.sendRedirect(msg);
	%>

</body>
</html>