package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//회원가입 Action클래스
//1.파라미터값을 Member 객체에 저장
//2.Member객체를 db에 저장.
//3.로그인화면을 결과화면으로 설정.

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