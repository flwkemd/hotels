package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import model.MemberDao;
/*
 * id,pass �Ķ���͸� db������ ���ϱ�
 * �α��� ���� : �޼��� ��� �� main.me
 * �α��� ���� : �޼��� ��� �� loginForm.me
 */

public class LoginCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward(false, "../alert.jsp");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDao dao = new MemberDao();
		//member : id�� �ش��ϴ� ȸ�� ���� ����
		Member member = dao.selectOne(id);
		String msg = "���̵� Ȯ���ϼ���";
		String url = "loginForm.jsp";
		if(member != null) { //id ȸ�� ����
			//�α��μ���
			//pass : ���� �Է��� ��й�ȣ
			//member.getPass() : db����� ��й�ȣ
			if(password.equals(member.getPassword())) {
				request.getSession().setAttribute("login", id);
				url = "main.me";
				msg = id+"���� �α����ϼ̽��ϴ�.";
			}else {
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return forward;
	}

}
