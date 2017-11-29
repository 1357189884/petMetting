package cn.tedu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.tedu.pojo.Module;

public interface ModuleMapper {

	public List<Module> findAll();

	public void changeState(@Param("state")Integer i, @Param("moduleIds")String[] moduleIds);

	public void delete(String[] moduleIds);

	public void save(Module module);

	public Module findOne(String moduleId);

	public void update(Module module);
	@Select("select module_id from role_module where role_id=#{roleId}")
	public List<String> findModulesByRoleId(String roleId);

	public void deleteRMByRoleId(String[] roleIds);

}
