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
	 * 1.�Խù��� �ִ��ȣ ��ȸ
	 * 2.board ��ü : num <= �ִ��ȣ
	 *               ref <= �ִ��ȣ
	 * 3.board ��ü db�� �����ϱ�              
	 */
	public static final String ns = "mapper.BoardMapper.";
	public boolean insert(Board board){
		if(board.getFile1()==null) {
			board.setFile1("");
		}
		SqlSession session = DBConnection.getSession();
		try{
			// num : �ִ� �Խù� ��ȣ
			int num = session.getMapper(BoardMapper.class).maxnum();
			num++;
			board.setNum(num);
			board.setRef(num);
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


	}//boardCount() �޼ҵ� ����
	//�Խù��� ��ȸ. page����
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
			board.setFile1("");
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

