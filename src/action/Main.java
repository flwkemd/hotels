package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 로그인 상태인 경우 main.jsp를 표시
 * 로그인 상태가 아닌 경우 : loginForm.me 표시
 */
public class Main implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		if (login==null || login.equals("login"))
			return new ActionForward(true,"first.jsp");
		else
			return new ActionForward(false,"first.jsp");
	}

}
