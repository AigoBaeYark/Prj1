package customer.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeEditProcController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		System.out.println("noticeProc.doooooooooooo");
		
		String seq = request.getParameter("seq");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println("seq : " + seq);
		
		
		
		NoticeDao dao = new NoticeDao();
		Notice n = new Notice();
		n.setSeq(seq);
		n.setTitle(title);
		n.setContent(content);
		
		dao.update(n);
		System.out.println("content : " + n.getContent());
		
		request.setAttribute("n", n);
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	}
}
