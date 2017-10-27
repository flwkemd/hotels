package mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import board.Board;

public interface BoardMapper {

	
	@Select("select nvl(max(num),0) from board2")
	int maxnum();
	
	
	@Insert("insert into board2"
            +"(num,id,date1,files,btype,"
            +" subtype, content, subject, readcnt, ref, reflevel, refstep) "
            +" values(#{num},#{id},sysdate,#{files},#{btype},#{subtype},#{content},#{subject},0,#{ref},#{reflevel},#{refstep})")
	void insert(Board board);

	@Select("select count(*) from board2")
	int boardcnt();

	@Select("select * from board2 where num = #{num}")
	Board select(int num);
	
	@Update("update board2 set readcnt=readcnt+1"
			+ " where num=#{num}")
	void Readcnt(int num);

	@Update("update board2 set  btype=#{btype}, subtype=#{subtype}, subject=#{subject}," + " content=#{content}, files=#{files} " + "where num=#{num}")
	boolean update(Board board);

	@Delete("delete from board2 where num=#{num}")
	boolean delete(int num);

	@Update("update board2" 
			+ " set refstep = refstep + 1" 
					+ " where ref=#{ref} and refstep > #{refstep}")
			void refstepupdate(Map map);

}
