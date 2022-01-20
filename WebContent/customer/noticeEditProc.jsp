<%@page import="customer.dao.NoticeDao"%>
<%@page import="customer.vo.Notice"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>noticeEditProc.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
	<h5>noticeEditProc.jsp</h5>

	<%
		request.setCharacterEncoding("utf-8");
		//db연결
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";
		Connection con=DriverManager.getConnection(url,user,pw);
		
		//데이터 가져오기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String seq = request.getParameter("c");
		//위  내용을 Notice에 담기
		
		Notice n = new Notice();
		n.setSeq(seq);
		n.setContent(content);
		n.setTitle(title);
		
		//객체로 보내기
		NoticeDao dao = new NoticeDao();
		//int af = dao.update(n);
		
		//변수로 보낼때
		int af = dao.update2(seq,title,content);
		
		if(af > 0 ){	//update가 된 것이 하나라도 있으면
			response.sendRedirect("noticeDetail.jsp?c="+seq);
		}else{			//update를 못했으면
			out.write("수정오류");
			out.write(content);
			out.write(title);
			out.write(seq);
		}
		
		//sql문 실행하여 데이터수정
		/* String sql = "update notices " + "set title = ? , content = ? where seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, seq);
		//실행
		pstmt.executeUpdate(); */
		
		//내용수정후 다시 detail페이지로
		//response.sendRedirect("noticeDetail.jsp?c="+seq);
	
	%>


</body>
</html>

