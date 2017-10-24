package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import model.MemberDao;
/*
 * id,pass 파라미터를 db정보와 비교하기
 * 로그인 성공 : 메세지 출력 후 main.me
 * 로그인 실패 : 메세지 출력 후 loginForm.me
 */

public class LoginCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward(false, "../alert.jsp");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDao dao = new MemberDao();
		//member : id에 해당하는 회원 정보 저장
		Member member = dao.selectOne(id);
		String msg = "아이디를 확인하세요";
		String url = "loginForm.jsp";
		if(member != null) { //id 회원 존재
			//로그인성공
			//pass : 고객이 입력한 비밀번호
			//member.getPass() : db저장된 비밀번호
			if(password.equals(member.getPassword())) {
				request.getSession().setAttribute("login", id);
				url = "main.me";
				msg = id+"님이 로그인하셨습니다.";
			}else {
				msg = "비밀번호가 틀렸습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return forward;
	}

}
