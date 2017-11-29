package cn.tedu.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mapper.ModuleMapper;
import cn.tedu.pojo.Module;
@Service
public class ModuleServiceImpl implements ModuleService {

	@Autowired
	private ModuleMapper modulemapper;
	@Override
	public List<Module> findAll() {
		
		return modulemapper.findAll();
	}
	@Override
	public void changeState(Integer i, String[] moduleIds) {
		modulemapper.changeState(i,moduleIds);
	}
	@Override
	public void delete(String[] moduleIds) {
		modulemapper.delete(moduleIds);
	}
	@Override
	public void save(Module module) {
		module.setModuleId(UUID.randomUUID().toString());
		modulemapper.save(module);
	}
	@Override
	public Module findOne(String moduleId) {
		// TODO Auto-generated method stub
		return modulemapper.findOne(moduleId);
	}
	@Override
	public void update(Module module) {
		// TODO Auto-generated method stub
		modulemapper.update(module);
	}
	@Override
	public List<String> findModulesByRoleId(String roleId) {
		// TODO Auto-generated method stub
		return modulemapper.findModulesByRoleId(roleId);
	}

}
