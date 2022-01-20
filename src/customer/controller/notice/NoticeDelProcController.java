package customer.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeDelProcController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeDelProc.doooooooooooo");
		
		String seq = request.getParameter("seq");
		System.out.println("seq : " + seq);
		
		
		NoticeDao dao = new NoticeDao();
		int del = dao.delete(seq);
	
		//삭제하는 sql문
		if(del > 0 ){	//무언가 삭제되었다면
			
			response.sendRedirect("notice.jsp");
		}else{
			System.out.println("삭제오류");
		}
		
		
		request.getRequestDispatcher("notice.jsp").forward(request, response);
	}
}
