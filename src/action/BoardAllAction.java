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

//POJO 클래스 : 순수자바 (Plain Old Java Object)
//				다른 클래스와 연관(상속, 구현)이 안된 클래스
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
				request.setAttribute("msg", "게시글 등록 성공");
				request.setAttribute("url", "list.bo");
			}else{
				request.setAttribute("msg", "게시글 등록 실패");
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
			//기시물의 출력되는 번호
			int boardNum = listcount - ((pageNum - 1)*limit);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("maxpage", maxpage);
			// maxpage : 게시판에 필요한 페이지 수
			request.setAttribute("startpage", startpage);
			//startpage : 현재 페이지에 보여질 첫번째 페이지 번호
			request.setAttribute("endpage", endpage);
			//endpage : 현재 페이지에 보여질 마지막 페이지 번호
			request.setAttribute("listcount", listcount);

			request.setAttribute("list", list);
			//list: 현재 페이지에 출력될 게시물 목록
			request.setAttribute("boardNum", boardNum);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			request.setAttribute("today", today);

			return new ActionForward(false,"list.jsp");
		}
	
	public ActionForward list2 (HttpServletRequest request,HttpServletResponse response){
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
		//기시물의 출력되는 번호
		int boardNum = listcount - ((pageNum - 1)*limit);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		// maxpage : 게시판에 필요한 페이지 수
		request.setAttribute("startpage", startpage);
		//startpage : 현재 페이지에 보여질 첫번째 페이지 번호
		request.setAttribute("endpage", endpage);
		//endpage : 현재 페이지에 보여질 마지막 페이지 번호
		request.setAttribute("listcount", listcount);
		
		request.setAttribute("list", list);
		//list: 현재 페이지에 출력될 게시물 목록
		request.setAttribute("boardNum", boardNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
		
		return new ActionForward(false,"list2.jsp");
	}
	
	public ActionForward list3 (HttpServletRequest request,HttpServletResponse response){
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
		//기시물의 출력되는 번호
		int boardNum = listcount - ((pageNum - 1)*limit);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		// maxpage : 게시판에 필요한 페이지 수
		request.setAttribute("startpage", startpage);
		//startpage : 현재 페이지에 보여질 첫번째 페이지 번호
		request.setAttribute("endpage", endpage);
		//endpage : 현재 페이지에 보여질 마지막 페이지 번호
		request.setAttribute("listcount", listcount);
		
		request.setAttribute("list", list);
		//list: 현재 페이지에 출력될 게시물 목록
		request.setAttribute("boardNum", boardNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
		
		return new ActionForward(false,"list3.jsp");
	}
	
	public ActionForward list4 (HttpServletRequest request,HttpServletResponse response){
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
		//기시물의 출력되는 번호
		int boardNum = listcount - ((pageNum - 1)*limit);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		// maxpage : 게시판에 필요한 페이지 수
		request.setAttribute("startpage", startpage);
		//startpage : 현재 페이지에 보여질 첫번째 페이지 번호
		request.setAttribute("endpage", endpage);
		//endpage : 현재 페이지에 보여질 마지막 페이지 번호
		request.setAttribute("listcount", listcount);
		
		request.setAttribute("list", list);
		//list: 현재 페이지에 출력될 게시물 목록
		request.setAttribute("boardNum", boardNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
		
		return new ActionForward(false,"list4.jsp");
	}
	
	public ActionForward list5 (HttpServletRequest request,HttpServletResponse response){
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
		//기시물의 출력되는 번호
		int boardNum = listcount - ((pageNum - 1)*limit);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		// maxpage : 게시판에 필요한 페이지 수
		request.setAttribute("startpage", startpage);
		//startpage : 현재 페이지에 보여질 첫번째 페이지 번호
		request.setAttribute("endpage", endpage);
		//endpage : 현재 페이지에 보여질 마지막 페이지 번호
		request.setAttribute("listcount", listcount);
		
		request.setAttribute("list", list);
		//list: 현재 페이지에 출력될 게시물 목록
		request.setAttribute("boardNum", boardNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
		
		return new ActionForward(false,"list5.jsp");
	}
	
	public ActionForward list6 (HttpServletRequest request,HttpServletResponse response){
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
		//기시물의 출력되는 번호
		int boardNum = listcount - ((pageNum - 1)*limit);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		// maxpage : 게시판에 필요한 페이지 수
		request.setAttribute("startpage", startpage);
		//startpage : 현재 페이지에 보여질 첫번째 페이지 번호
		request.setAttribute("endpage", endpage);
		//endpage : 현재 페이지에 보여질 마지막 페이지 번호
		request.setAttribute("listcount", listcount);
		
		request.setAttribute("list", list);
		//list: 현재 페이지에 출력될 게시물 목록
		request.setAttribute("boardNum", boardNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
		
		return new ActionForward(false,"list6.jsp");
	}
	
	public ActionForward list7 (HttpServletRequest request,HttpServletResponse response){
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
		//기시물의 출력되는 번호
		int boardNum = listcount - ((pageNum - 1)*limit);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		// maxpage : 게시판에 필요한 페이지 수
		request.setAttribute("startpage", startpage);
		//startpage : 현재 페이지에 보여질 첫번째 페이지 번호
		request.setAttribute("endpage", endpage);
		//endpage : 현재 페이지에 보여질 마지막 페이지 번호
		request.setAttribute("listcount", listcount);
		
		request.setAttribute("list", list);
		//list: 현재 페이지에 출력될 게시물 목록
		request.setAttribute("boardNum", boardNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
		
		return new ActionForward(false,"list7.jsp");
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
		//1. 파라미터 정보를 Boaed 객체에 저장
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
		//답변 등록 성공시 "답변글 등록 완료",list.bo
		//답변 등록 실패시 "답변글 등록 실패",replyForm.bo
		String pageNum = request.getParameter("pageNum");
		if(dao.reply(board)) {
			request.setAttribute("msg", "답변글 등록 완료");
			request.setAttribute("url", "list.bo?pageNum="+pageNum);
		} else {
			request.setAttribute("msg", "답변글 등록 실패");
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
			String file2 = multi.getParameter("file2");
			BoardDao dao = new BoardDao();
			board.setNum(num);
			board.setId(multi.getParameter("id"));
			board.setBtype(multi.getParameter("btype"));
			board.setSubtype(multi.getParameter("subtype"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFiles(multi.getFilesystemName("files"));
			if(board.getFiles() == null || board.getFiles().equals("")){
				board.setFiles(multi.getParameter("file2"));
			}
			request.setAttribute("url", "updateForm.bo?num=" + num);
				if(dao.update(board)) {
					request.setAttribute("msg", "게시물 수정 완료");
					request.setAttribute("url", "list.bo");
				}else {
					request.setAttribute("msg", "게시물 수정시 오류 발생");
				}
		} catch (IOException e) {
			e.printStackTrace();
			request.setAttribute("msg", "게시물 수정 오류");
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
				request.setAttribute("msg", "게시물 삭제완료");
			}else {
				request.setAttribute("msg", "게시물 삭제실패");
			}
		request.setAttribute("url", "list.bo");
		return new ActionForward(false,"../alert.jsp");
}
}
