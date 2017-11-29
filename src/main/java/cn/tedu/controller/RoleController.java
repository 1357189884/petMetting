package cn.tedu.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.tedu.pojo.Module;
import cn.tedu.pojo.Role;
import cn.tedu.service.ModuleService;
import cn.tedu.service.RoleService;

@Controller
public class RoleController {
	@Autowired
	private RoleService roleService;
	@Autowired
	private ModuleService moduleService;
	@RequestMapping("/rolelist")
	public String roleList(Model model) {
		List<Role> roles=roleService.findAll();
		 model.addAttribute("roles", roles);
		return "/role/rolelist";
	}
	@RequestMapping("/stop")
	public String startAction(@RequestParam(value="roleId",required=false)String[] roleIds){
	if(roleIds!=null){
		roleService.changeState(0,roleIds);
		}
	return "redirect:/rolelist";
	}
	@RequestMapping("/start")
	public String stopAction(@RequestParam(value="roleId",required=false)String[] roleIds){
		if(roleIds!=null){
			roleService.changeState(1,roleIds);
		}
		return "redirect:/rolelist";
	}
	
	
	@RequestMapping("/rolecreate")
	public String userCreate() {
		
		return "/role/rolecreate";
	}
	@RequestMapping("/save")
	public String roleSeve(Role role,Model model) {
		roleService.save(role);
		return "redirect:/rolelist";
	}
	@RequestMapping("/updatelist")
	public String updateList(Model model) {
		List<Role> roles=roleService.findAll();
		 model.addAttribute("roles", roles);
		return "/role/updatelist";
	}
	@RequestMapping("/roleupdate")
	public String roleUpdate(String roleId,Model model){
		Role role=roleService.finOne(roleId);
		model.addAttribute("role", role);
		return "/role/roleupdate";
	}
	@RequestMapping("/update")
	public String update(Role role) {                                     
		roleService.update(role);
		return "redirect:/updatelist";
	}
	@RequestMapping("/deletelist")
	public String deleteList(Model model) {
		List<Role> roles=roleService.findAll();
		 model.addAttribute("roles", roles);
		return "/role/deletelist";
	}
	@RequestMapping("/roledelete")
	public String roleDelete(@RequestParam(value="roleId" ,required=false)String[] roleIds) {
		roleService.delete(roleIds);
		return "redirect:/deletelist";
	}
	@RequestMapping("/rolemodulelist")
	public String rolemodulelist(Model model) {
		List<Role> roles=roleService.findAll();
		 model.addAttribute("roles", roles);
		return "/role/rolemodulelist";
	}
	@RequestMapping("/toModule")
	public String toModule(String roleId,Model model) throws JsonProcessingException{
		//查询所有的模块信息
		List<Module> modules = moduleService.findAll();
		//查询当前角色所对应的所有的模块
		List<String> roleModule=moduleService.findModulesByRoleId(roleId);
		//遍历所有的模块
		for (Module module : modules) {
			//判断角色拥有的模块id是否包含当前遍历的模块 如果包含则让
			if(roleModule.contains(module.getId())){
				
				module.setChecked(true);
			}
		}//给页面传递 zTree格式的json字符串
		ObjectMapper mapper=new ObjectMapper();
		String zTreeJson = mapper.writeValueAsString(modules);
		model.addAttribute("zTreeJson", zTreeJson);
		model.addAttribute("id",roleId);
		return "/role/roleModule";
	}
		@RequestMapping("/saveRoleModule")
		public String saveRoleModule(String roleId,String[] moduleIds){
			
			if(moduleIds!=null){
				roleService.saveRoleModule(roleId,moduleIds);
			}
			return "redirect:/rolemodulelist";
		}
	
}	
