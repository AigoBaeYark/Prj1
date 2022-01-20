package customer.controller.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.db.DBCon;
import customer.vo.Notice;

public class NoticeController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("notice.doooooooooooo");
		//search
		String field = request.getParameter("f");
		System.out.println("field : " + field);
		
		String query = request.getParameter("q");
		System.out.println("query  : " + query);
		
		//검색을 하지 않았으면
		if(field == null || field.equals("")) 
			field="title";
		if(query == null)
			query="";
		
		
		
		//db에서 notices의 테이블에 있는 내용 모두를 조회
		
		NoticeDao dao = new NoticeDao();
		List<Notice> list = dao.noticeSelAll(field, query);
		
		//List<Notice> 를 requset에 저장
		request.setAttribute("list", list);
		request.setAttribute("query", query);
		//notice.jsp 로 보내면서 포워딩
		request.getRequestDispatcher("notice.jsp").forward(request, response);
		
		for (Notice notice : list) {
			
		}
		
	}
}
