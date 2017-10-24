package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import model.MemberDao;

public class Delete extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = new MemberDao().delete(id);
//		Member mem = new Member();
//		mem.setId(id);
//		int result = new MemberDao().delete(mem);
		if(result > 0){
			request.setAttribute("msg", "Å»Åð¿Ï·á");
			if(sessionId.equals("admin")){
				request.setAttribute("url", "list.me");
			}else{
				request.setAttribute("url", "loginForm.me");
				request.getSession().invalidate();
			}
		}else{//Å»Åð ½ÇÆÐ
			request.setAttribute("msg", "Å»Åð½ÇÆÐ");
			if(sessionId.equals("admin")){
				request.setAttribute("url", "list.me");
			}else{
				request.setAttribute("url", "main.me");
			}
		}
		return new ActionForward(false,"../alert.jsp");
	}

}
