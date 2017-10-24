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

import mapper.MemberMapper;
import member.Member;

public class MemberDao {
	public static final String ns = "mapper.MemberMapper.";
	//member 객체 : 파라미터 값이 저장
	public int insert(Member member){
		SqlSession session = DBConnection.getSession();

		try{
			 session.getMapper(MemberMapper.class).insert(member);
			 return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.close(session);
		}
		return 0;
	}
	public Member selectOne(String id) {
		SqlSession session = DBConnection.getSession();
		try { 
			String sql = "select * from member where id=?";
			Map map = new HashMap();
			map.put("id", id);
			return session.selectOne(ns+"select",map);
		} catch(Exception e) {
			e.printStackTrace();
		}finally { 
			DBConnection.close(session);
		}
		return null;
	}
	public List<Member> list() {
		SqlSession session = DBConnection.getSession();
	      try {
	    	  return session.selectList(ns+"select");
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally{
	         DBConnection.close(session);
	      }
	      return null;

	   }
	public int update(Member m) {
		SqlSession session = DBConnection.getSession();
		
		try {
			return session.getMapper(MemberMapper.class).update(m);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public int delete(String id){
		SqlSession session = DBConnection.getSession();
	      try{
	    	  String sql="delete from member where id=#{id}";
	         return session.getMapper(MemberMapper.class).delete(id);
	      }catch(Exception e){
	         e.printStackTrace();
	      }finally{
	         DBConnection.close(session);
	      }
	      return 0;
	            
	   }

}
