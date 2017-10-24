package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import model.MemberDao;

public class Info extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member member = new MemberDao().selectOne(id);
		request.setAttribute("mem", member);
		return new ActionForward(false,"info.jsp");
	}

}
