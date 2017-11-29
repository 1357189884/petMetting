package cn.tedu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.tedu.pojo.Role;

public interface RoleMapper {

	public List<Role> findAll();

	public void changeState(@Param("state")int i, @Param("roleIds")String[] roleIds);

	public void save(Role role);

	public Role findOne(String roleId);

	public void update(Role role);

	public List<String> findRolesByUid(String userId);
	
	public void deleteRolesByUid(String userId);

	public void saveUserAndRole(@Param("userId")String userId, @Param("roleIds")String[] roleIds);

	public void delete(String[] roleIds);


	public void saveRoleModule(@Param("roleId")String roleId, @Param("moduleIds")String[] moduleIds);

	public void deleteUserRole(String[] roleIds);

	public void deleteModuleRole(String[] roleIds);
}
