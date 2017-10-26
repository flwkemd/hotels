package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.Board;
import mapper.BoardMapper;
import member.Member;

public class BoardDao {
	/*
	 * 1.게시물의 최대번호 조회
	 * 2.board 객체 : num <= 최대번호
	 *               ref <= 최대번호
	 * 3.board 객체 db에 저장하기              
	 */
	public static final String ns = "mapper.BoardMapper.";
	public boolean insert(Board board){
		if(board.getFiles()==null) {
			board.setFiles("");
		}
		SqlSession session = DBConnection.getSession();
		try{
			// num : 최대 게시물 번호
			int num = session.getMapper(BoardMapper.class).maxnum();
			num++;
			board.setNum(num);
			session.getMapper(BoardMapper.class).insert(board);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(session);
		}
		return false;
	}
	public int boardCount(){
		SqlSession session = DBConnection.getSession();
		try{
			int num = session.getMapper(BoardMapper.class).boardcnt();
			return num;
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			DBConnection.close(session);
		}
		return 0;


	}//boardCount() 메소드 종료
	//게시물들 조회. page별로
	public List<Board> list(int pageNum, int limit){
		SqlSession session = DBConnection.getSession();
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		Map map = new HashMap();
		map.put("startrow",startrow);
		map.put("endrow",endrow);
		try{
			return session.selectList(ns+"list",map);
		
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			DBConnection.close(session);
		}
	}
	
	public Board selectOne(int num){
		SqlSession session = DBConnection.getSession(); 
		try{
			return session.getMapper(BoardMapper.class).select(num);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(session);
		}
		return null;
	}
	
	public void addReadCnt(int num){
		SqlSession session = DBConnection.getSession(); 
		try{
			session.getMapper(BoardMapper.class).Readcnt(num);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(session);
		}	
	}

	public boolean update(Board board) {
		SqlSession session = DBConnection.getSession(); 
		try {
			return session.getMapper(BoardMapper.class).update(board);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		} return false;
	}
	
	public boolean delete(int num){
		SqlSession session = DBConnection.getSession(); 
		
		try{
			return session.getMapper(BoardMapper.class).delete(num);
		}catch(Exception e){
			e.printStackTrace();

		}finally{
			DBConnection.close(session);
		}
		return false;

	}
	
	public boolean reply(Board board) {
		SqlSession session = DBConnection.getSession(); 
		int num = 0;
		int ref = board.getRef();
		int reflevel = board.getReflevel();
		int refstep = board.getRefstep();
		
		try {
			Map map = new HashMap();
			map.put("ref",ref);
			map.put("refstep",refstep);
			session.getMapper(BoardMapper.class).refstepupdate(map);
			
			board.setRef(ref);
			board.setReflevel(++reflevel);
			board.setRefstep(++refstep);
			board.setFiles("");
			num = session.getMapper(BoardMapper.class).maxnum();
			num++;
			board.setNum(num);
			session.getMapper(BoardMapper.class).insert(board);
			return true;		
			
		} catch(Exception e) {
			e.printStackTrace();
			
			return false;
		}finally {
			DBConnection.close(session);
		}
	}

}

