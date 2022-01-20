package customer.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeDetailController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("noticeDetail.dooooooooooo");
		String seq = request.getParameter("seq");
		System.out.println("seq : "+ seq);
		NoticeDao dao = new NoticeDao();
		Notice n = dao.getNotice(seq);
		
		//Notice를 request에 저장
		request.setAttribute("n", n);
		
		//noticeDeatail.jsp로 보내면서 request도 함께 포워딩
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
		
	}
}
