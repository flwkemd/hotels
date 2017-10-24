package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//�߻�Ŭ���� : 1.�߻�޼��尡 �ִ� Ŭ����
//			2. ��üȭ �Ұ�
//			     
public abstract class UserLoginAction implements Action {
	
	protected String sessionId=null;
	protected String id = null;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		sessionId = (String)request.getSession().getAttribute("login");
		id= request.getParameter("id");
		if(sessionId == null || sessionId.equals("")) { //�α��ξȵ�
			request.setAttribute("msg","loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}else {
			if(!sessionId.equals(id) && !sessionId.equals("admin")) {
				request.setAttribute("msg", "���������ƴ�");
				request.setAttribute("url", "main.me");
				return new ActionForward(false,"../alert.jsp");
			}
		}
		return doExecute(request,response);
	}
	//�߻�޼��� :  { ������ } ����.
	//			�ݵ�� �������̵��� �ʿ��� �޼���
	public abstract ActionForward doExecute(HttpServletRequest request , HttpServletResponse response) throws Exception;
}
