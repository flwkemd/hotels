package mapper;



import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import member.Member;

public interface MemberMapper {

	@Select("insert into joins" + "(id, name, nickname, password, place, regnumber)"
			+" values(#{id},#{name},#{nickname},#{password},"
			+"#{place},#{regnumber})")
	void insert(Member member);
	
	@Update("update joins set password=#{password},name=#{name},nickname=#{nickname},place=#{place},regnumber=#{regnumber} where id=#{id}")
	int update(Member m);
	
	@Delete("delete from joins where id=#{id}")
	int delete(String id);
}
