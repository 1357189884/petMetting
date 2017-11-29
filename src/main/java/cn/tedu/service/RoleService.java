package cn.tedu.service;

import java.util.List;

import cn.tedu.pojo.Role;

public interface RoleService {

	public List<Role> findAll();

	public void changeState(int i, String[] roleIds);

	public void save(Role role);

	public Role finOne(String roleId);

	public void update(Role role);

	public void delete(String[] roleIds);


	public List<String> findRolesByUid(String userId);

	public void saveUserAndRole(String userId, String[] roleIds);


	public void saveRoleModule(String roleId, String[] moduleIds);


}
