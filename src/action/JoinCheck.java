package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//ȸ������ ActionŬ����
//1.�Ķ���Ͱ��� Member ��ü�� ����
//2.Member��ü�� db�� ����.
//3.�α���ȭ���� ���ȭ������ ����.

import member.Member;
import model.MemberDao;
public class JoinCheck implements Action {
   Member mem = new Member();
   MemberDao mdao = new  MemberDao();
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		mem.setId(request.getParameter("id"));
		mem.setName(request.getParameter("name"));
		mem.setNickname(request.getParameter("nickname"));
		mem.setPassword(request.getParameter("password"));
		mem.setPlace(request.getParameter("place"));
		mem.setRegnumber(request.getParameter("regnumber"));
      System.out.println(mem);
      mdao.insert(mem);
      return new ActionForward(true,"main.me");
   }

}