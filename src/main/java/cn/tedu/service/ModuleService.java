package cn.tedu.service;

import java.util.List;

import cn.tedu.pojo.Module;

public interface ModuleService {

	public List<Module> findAll();

	public void changeState(Integer i, String[] moduleIds);

	public void delete(String[] moduleIds);

	public void save(Module module);

	public Module findOne(String moduleId);

	public void update(Module module);

	public List<String> findModulesByRoleId(String roleId);

}
