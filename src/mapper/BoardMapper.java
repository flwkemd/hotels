package mapper;



import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import board.Board;

public interface BoardMapper {

	
	@Select("select nvl(max(num),0) from board")
	int maxnum();
	
	
	@Insert("insert into board"
            +"(num,name, pass,subject, content,file1,"
            +" regdate, readcnt, ref, reflevel, refstep) "
            +" values(#{num},#{name},#{pass},#{subject},#{content},#{file1},sysdate,0,#{ref},#{reflevel},#{refstep})")
	void insert(Board board);
	

	@Select("select count(*) from board")
	int boardcnt();

	@Select("select * from board where num = #{num}")
	Board select(int num);

	@Update("update board set readcnt=readcnt+1"
					+ " where num=#{num}")
	void Readcnt(int num);

	@Update("update board set subject=#{subject}," + " content=#{content}, file1=#{file1} " + "where num=#{num}")
	boolean update(Board board);

	@Delete("delete from board where num=#{num}")
	boolean delete(int num);

	@Update("update board" 
	+ " set refstep = refstep + 1" 
			+ " where ref=#{ref} and refstep > #{refstep}")
	void refstepupdate(Map map);



}
