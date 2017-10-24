package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import model.MemberDao;

public  class MemberList extends AdminLoginAction {
	@Override
	public ActionForward adminExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Member> list = new MemberDao().list();
		request.setAttribute("list", list);
		return new ActionForward(false,"list.jsp");
	}
}


