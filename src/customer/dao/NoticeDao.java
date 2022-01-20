package customer.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sun.corba.se.spi.orbutil.fsm.State;

import customer.db.DBCon;
import customer.vo.Notice;

public class NoticeDao {

	public List<Notice> noticeSelAll(String field, String query) throws Exception {
		// List에 notices 내용을 담기
		Connection con = DBCon.getcConnection(); // db 접속
		String sql = "";
		Statement st = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 실행 filed(검색했을때) 값이 있으면 검색한 값으로 아니면 전체가 보이게
		/*if (field != null) {
			System.out.println(field);
			System.out.println(query);
			sql = "select * from notices where " + field + " like ? order by seq desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%" + query + "%");
		rs = pstmt.executeQuery();
			
		} else {
			System.out.println("dao2");
			sql = "select * from notices order by seq desc";
			st = con.createStatement();
			rs = st.executeQuery(sql);
		}*/
		
		sql = "select * from notices where " + field + " like ? order by seq desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%" + query + "%");
		rs = pstmt.executeQuery();

		// 결과

		// List에 notices 내용을 담기
		List<Notice> list = new ArrayList<Notice>();
		while (rs.next()) {
			System.out.println("rsdao1");
			Notice n = new Notice();
			n.setSeq(rs.getString("seq"));
			n.setContent(rs.getString("content"));
			n.setHit(rs.getInt("hit"));
			n.setRegdate(rs.getDate("regdate"));
			n.setTitle(rs.getString("title"));
			;
			n.setWriter(rs.getString("writer"));

			list.add(n);
		}

		return list;

	}

	public int update(Notice notice) throws Exception {

		Connection con = DBCon.getcConnection();

		// Class.forName("oracle.jdbc.driver.OracleDriver");
		// String url = "jdbc:oracle:thin:@localhost:1521:xe";
		// String user = "hr";
		// String pw = "123456";
		// Connection con=DriverManager.getConnection(url,user,pw);

		String sql = "update notices " + "set title = ? , content = ? where seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());
		// 실행
		int af = pstmt.executeUpdate();

		return af;
	}

	public int update2(String seq, String title, String content) throws Exception {

		Connection con = DBCon.getcConnection();

		// Class.forName("oracle.jdbc.driver.OracleDriver");
		// String url = "jdbc:oracle:thin:@localhost:1521:xe";
		// String user = "hr";
		// String pw = "123456";
		// Connection con=DriverManager.getConnection(url,user,pw);

		String sql = "update notices " + "set title = ? , content = ? where seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, seq);
		// 실행
		int af = pstmt.executeUpdate();

		return af;
	}

	public Notice getNotice(String seq) throws Exception { // 글번호 받아오기
		// notcieDetail.jsp?c= 라고 되어있어서 c로 받음

		// seq 와 같은(선택한 게시물) 데이터 가져옴
		String sql = "SELECT *FROM NOTICES WHERE seq = " + seq;

		// dbcon

		Connection con = DBCon.getcConnection();

		/*
		 * Class.forName("oracle.jdbc.driver.OracleDriver");
		 * 
		 * String url = "jdbc:oracle:thin:@localhost:1521:xe"; String user = "hr";
		 * String pw = "123456"; Connection con = DriverManager.getConnection(url, user,
		 * pw);
		 */

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);

		rs.next();

		Notice n = new Notice();
		n.setSeq(rs.getString("seq"));
		n.setContent(rs.getString("content"));
		n.setHit(rs.getInt("hit"));
		n.setRegdate(rs.getDate("regdate"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));

		rs.close();
		st.close();
		con.close();

		return n;
	}

	public int write(Notice notice) throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");

		Connection con = DBCon.getcConnection();
		/*
		 * String url="jdbc:oracle:thin:@localhost:1521:xe"; String user = "hr"; String
		 * pw = "123456"; Connection con = DriverManager.getConnection(url, user, pw);
		 */

		String sql = "INSERT INTO NOTICES VALUES ((SELECT max(TO_NUMBER(seq))+1 FROM NOTICES) ,?,'cj',sysdate,0, ? )";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		int af = pstmt.executeUpdate(); // insert실행

		return af;
	}

	public int delete(String seq) throws Exception {
		String sql = "delete from notices where seq = " + seq;

		Connection con = DBCon.getcConnection();
		/*
		 * Class.forName("oracle.jdbc.driver.OracleDriver"); String url =
		 * "jdbc:oracle:thin:@localhost:1521:xe"; String user = "hr"; String pw =
		 * "123456"; Connection con = DriverManager.getConnection(url, user, pw);
		 */
		PreparedStatement pstmt = con.prepareStatement(sql);
		int del = pstmt.executeUpdate(); // 삭제sql문 적용 //삭제되면 del+=1

		return del;
	}
}
