package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//추상클래스 : 1.추상메서드가 있는 클래스
//			2. 객체화 불가
//			     
public abstract class UserLoginAction implements Action {
	
	protected String sessionId=null;
	protected String id = null;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		sessionId = (String)request.getSession().getAttribute("login");
		id= request.getParameter("id");
		if(sessionId == null || sessionId.equals("")) { //로그인안됨
			request.setAttribute("msg","loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}else {
			if(!sessionId.equals(id) && !sessionId.equals("admin")) {
				request.setAttribute("msg", "본인정보아님");
				request.setAttribute("url", "main.me");
				return new ActionForward(false,"../alert.jsp");
			}
		}
		return doExecute(request,response);
	}
	//추상메서드 :  { 구현부 } 없다.
	//			반드시 오버라이딩이 필요한 메서드
	public abstract ActionForward doExecute(HttpServletRequest request , HttpServletResponse response) throws Exception;
}
