package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class AdminLoginAction implements Action {
	protected String sessionId;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		sessionId=(String)request.getSession().getAttribute("login");
		if(sessionId == null) {
			request.setAttribute("msg", "관리자의 로그인이 필요합니다.");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false,"../alert.jsp");
	}
		if(!sessionId.equals("admin")) {
			request.setAttribute("msg", "관리자만 가능한 업무입니다.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		return adminExecute(request,response);
	}
	public abstract ActionForward adminExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
