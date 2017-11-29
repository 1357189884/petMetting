package cn.tedu.mapper;

import org.apache.ibatis.annotations.Param;

import cn.tedu.pojo.User;

public interface UserMapper {

	public User login(@Param("username")String username, @Param("password")String password);

	public User find(String username);

	public void saveUser(User user);

}
