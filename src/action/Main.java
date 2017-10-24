package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * �α��� ������ ��� main.jsp�� ǥ��
 * �α��� ���°� �ƴ� ��� : loginForm.me ǥ��
 */
public class Main implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		if (login==null || login.equals("login"))
			return new ActionForward(true,"loginForm.me");
		else
			return new ActionForward(false,"main.jsp");
	}

}
