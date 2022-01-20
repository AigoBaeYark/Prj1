package customer.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeEditController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeEdit.doooooooooooo");
		
		String seq = request.getParameter("seq");
		System.out.println("seq : " + seq);
		
		NoticeDao dao = new NoticeDao();
		Notice n = dao.getNotice(seq);
		System.out.println("content : " + n.getContent());
		
		request.setAttribute("nt", n);
		request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);
	}
}
