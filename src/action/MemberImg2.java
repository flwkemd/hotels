package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class MemberImg2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String picturePath = request.getServletContext().getRealPath("/")
				+"/model2/member/picture/";
		MultipartRequest multi = new MultipartRequest(request,picturePath,
				10*1024*1024, "euc-kr");
		String filename = multi.getFilesystemName("picture");
		request.setAttribute("filename", filename);
		return new ActionForward(false,"memberimg2.jsp");
	}

}
