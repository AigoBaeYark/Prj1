package customer.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeRegController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("noticeReg.doooooooooooo");
		request.getRequestDispatcher("noticeReg.jsp").forward(request, response);
	}
}
