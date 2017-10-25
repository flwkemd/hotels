package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login= (String)request.getSession().getAttribute("login");
		request.getSession().invalidate();
		request.setAttribute("msg", login+"���� �α׾ƿ� �ϼ̽��ϴ�.");
		request.setAttribute("url", "first.jsp");
		return new ActionForward(false,"../alert.jsp");
	}

}
