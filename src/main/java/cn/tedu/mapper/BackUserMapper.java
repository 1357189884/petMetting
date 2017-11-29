package cn.tedu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.tedu.pojo.User;

public interface BackUserMapper {
@Select("select * from user")
	List<User> findAll();
   User findOne(String userId);
   void add(User user);
   void remove(String[] ids);
   void updat(User user);
void changeState(@Param(value="state") int i,@Param(value="userId") String[] ids);

}
