package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		request.setAttribute("hello", "�ȳ��ϼ���." + name + "�Դϴ�." );
		return new ActionForward(false,"hello.jsp");
	}
	

}
//hashtable : map Ŭ����