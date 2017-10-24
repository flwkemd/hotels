package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import model.MemberDao;

public class UpdateCheck extends UserLoginAction {

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setName(request.getParameter("name"));
		mem.setNickname(request.getParameter("Nickname"));
		mem.setPassword(request.getParameter("password"));
		mem.setPlace(request.getParameter("place"));
		mem.setRegnumber(request.getParameter("regnumber"));
		
		int result = new MemberDao().update(mem);
		if(result > 0){
			request.setAttribute("msg", "�����Ϸ�");
			request.setAttribute("url", "info.me?id="+id);
		}else{
			request.setAttribute("msg", "��������");
			request.setAttribute("url", "updateForm.me?="+id);
		}
		return new ActionForward(false,"../alert.jsp");
	}

}
