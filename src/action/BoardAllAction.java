package action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import board.Board;
import model.BoardDao;

//POJO Ŭ���� : �����ڹ� (Plain Old Java Object)
//				�ٸ� Ŭ������ ����(���, ����)�� �ȵ� Ŭ����
public class BoardAllAction {
	public ActionForward writeForm
	(HttpServletRequest request,HttpServletResponse response){
		return new ActionForward(false,"writeForm.jsp");
	}
	public ActionForward write
	(HttpServletRequest request,HttpServletResponse response){
		String path = request.getServletContext().getRealPath("/")
				+"/model2/board/file/";
		try{
			MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024,"euc-kr");
			Board board = new Board();
			board.setId(multi.getParameter("id"));
			board.setBtype(multi.getParameter("btype"));
			board.setSubtype(multi.getParameter("subtype"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFiles(multi.getFilesystemName("files"));
			BoardDao dao = new BoardDao();

			if(dao.insert(board)){
				request.setAttribute("msg", "�Խñ� ��� ����");
				request.setAttribute("url", "list.bo");
			}else{
				request.setAttribute("msg", "�Խñ� ��� ����");
				request.setAttribute("url", "writeForm.bo");
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward list (HttpServletRequest request,HttpServletResponse response){
		int pageNum = 1;
		int limit = 10;
		if(request.getParameter("pageNum") != null){
			
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			} 
			BoardDao dao = new BoardDao();
			int listcount = dao.boardCount();
			List<Board> list=dao.list(pageNum, limit);
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = ((int)(pageNum/10.0+0.9)-1)*10+1;
			int endpage = startpage+9;
			if(endpage > maxpage) endpage = maxpage;
			//��ù��� ��µǴ� ��ȣ
			int boardNum = listcount - ((pageNum - 1)*limit);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("maxpage", maxpage);
			// maxpage : �Խ��ǿ� �ʿ��� ������ ��
			request.setAttribute("startpage", startpage);
			//startpage : ���� �������� ������ ù��° ������ ��ȣ
			request.setAttribute("endpage", endpage);
			//endpage : ���� �������� ������ ������ ������ ��ȣ
			request.setAttribute("listcount", listcount);

			request.setAttribute("list", list);
			//list: ���� �������� ��µ� �Խù� ���
			request.setAttribute("boardNum", boardNum);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			request.setAttribute("today", today);

			return new ActionForward(false,"list.jsp");
		}
	public ActionForward info(HttpServletRequest request,HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDao dao = new BoardDao();
		Board board = dao.selectOne(num);
		dao.addReadCnt(num);
		request.setAttribute("board", board);
		return new ActionForward(false,"info.jsp");
	}
	public ActionForward replyForm(HttpServletRequest request,HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDao dao = new BoardDao();
		Board board = dao.selectOne(num);
		request.setAttribute("board", board);
		return new ActionForward(false,"replyForm.jsp");
	}
	public ActionForward reply(HttpServletRequest request,HttpServletResponse response){
		//1. �Ķ���� ������ Boaed ��ü�� ����
		Board board = new Board();
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setRef(Integer.parseInt(request.getParameter("ref")));
		board.setReflevel(Integer.parseInt(request.getParameter("reflevel")));
		board.setRefstep(Integer.parseInt(request.getParameter("refstep")));
		board.setId(request.getParameter("id"));
		board.setBtype(request.getParameter("btype"));
		board.setSubtype(request.getParameter("subtype"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		BoardDao dao = new BoardDao();
		dao.reply(board);
		//�亯 ��� ������ "�亯�� ��� �Ϸ�",list.bo
		//�亯 ��� ���н� "�亯�� ��� ����",replyForm.bo
		String pageNum = request.getParameter("pageNum");
		if(dao.reply(board)) {
			request.setAttribute("msg", "�亯�� ��� �Ϸ�");
			request.setAttribute("url", "list.bo?pageNum="+pageNum);
		} else {
			request.setAttribute("msg", "�亯�� ��� ����");
			request.setAttribute("url", "replyForm.bo?num="+request.getParameter("num") + "&pageNum=" + pageNum);
		}
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward updateForm(HttpServletRequest request,HttpServletResponse response) {
		int num= Integer.parseInt(request.getParameter("num"));
		Board board = new BoardDao().selectOne(num);
		request.setAttribute("board", board);
		return new ActionForward(false,"updateForm.jsp");
	}
	public ActionForward update(HttpServletRequest request,HttpServletResponse response) {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "/model2/board/file/";
		try {
			MultipartRequest multi = new MultipartRequest(request, path,5*1024*1024,"euc-kr");
			int num= Integer.parseInt(multi.getParameter("num"));
			BoardDao dao = new BoardDao();
			board.setNum(num);
			board.setId(multi.getParameter("id"));
			board.setBtype(multi.getParameter("btype"));
			board.setSubtype(multi.getParameter("subtype"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFiles(multi.getFilesystemName("files"));
			request.setAttribute("url", "updateForm.bo?num=" + num);
				if(dao.update(board)) {
					request.setAttribute("msg", "�Խù� ���� �Ϸ�");
					request.setAttribute("url", "list.bo");
				}else {
					request.setAttribute("msg", "�Խù� ������ ���� �߻�");
				}
		} catch (IOException e) {
			e.printStackTrace();
			request.setAttribute("msg", "�Խù� ���� ����");
		}
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward deleteForm(HttpServletRequest request,HttpServletResponse response) {
		return new ActionForward(false,"deleteForm.jsp");
	}
	public ActionForward delete(HttpServletRequest request,HttpServletResponse response) {
		int num=Integer.parseInt(request.getParameter("num"));
		BoardDao dao = new BoardDao();
			if(dao.delete(num)) {
				request.setAttribute("msg", "�Խù� �����Ϸ�");
			}else {
				request.setAttribute("msg", "�Խù� ��������");
			}
		request.setAttribute("url", "list.bo");
		return new ActionForward(false,"../alert.jsp");
}
}
