package customer.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeRegProcController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("noticeRegProc.doooooooooooo");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//dbconnect
		
		//title과 content 를 set 하고 dao에서 write 한다.
		NoticeDao dao = new NoticeDao();
		Notice n = new Notice();
		n.setTitle(title);
		n.setContent(content);
		
		int af = dao.write(n);
		
		if(af>0)	//write 가 하나라도 되었으면
			response.sendRedirect("notice.do");
		else 		//write 가 안되었으면
			System.out.println("글쓰기 오류");
		
		request.getRequestDispatcher("notice.do").forward(request, response);
		
	}
}
