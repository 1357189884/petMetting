package cn.tedu.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.ModuleMapper;
import cn.tedu.mapper.RoleMapper;
import cn.tedu.pojo.Role;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private ModuleMapper moduleMapper;
	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		return roleMapper.findAll();
	}
	@Override
	public void changeState(int i, String[] roleIds) {
		// TODO Auto-generated method stub
		roleMapper.changeState(i,roleIds);
	}
	@Override
	public void save(Role role) {
		// TODO Auto-generated method stub
		String roleId = UUID.randomUUID().toString();
		role.setRoleId(roleId);
		roleMapper.save(role);
	}
	@Override
	public Role finOne(String roleId) {
		// TODO Auto-generated method stub
		return roleMapper.findOne(roleId);
	
	}
	@Override
	public void update(Role role) {
		// TODO Auto-generated method stub
		roleMapper.update(role);
	}
	@Override
	public void delete(String[] roleIds) {
		// TODO Auto-generated method stub
		roleMapper.deleteUserRole(roleIds);
		roleMapper.deleteModuleRole(roleIds);
		roleMapper.delete(roleIds);
	}
	@Override
	public void saveRoleModule(String roleId, String[] moduleIds) {
		// TODO Auto-generated method stub
		if(moduleIds.length>0){
			roleMapper.saveRoleModule(roleId,moduleIds);
		}
		
	}
	@Override
	public List<String> findRolesByUid(String userId) {
		// TODO Auto-generated method stub
		return roleMapper.findRolesByUid(userId);
	}
	@Override
	public void saveUserAndRole(String userId, String[] roleIds) {
		
		roleMapper.deleteRolesByUid(userId);
		if (roleIds.length>0) {
			roleMapper.saveUserAndRole(userId, roleIds);
		}
	}

}
