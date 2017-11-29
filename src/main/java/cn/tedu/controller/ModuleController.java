package cn.tedu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tedu.pojo.Module;
import cn.tedu.service.ModuleService;

@Controller
public class ModuleController {
	
	@Autowired
	private ModuleService moduleservice;
	@RequestMapping("/module")
	public String List(HttpSession session){
		List<Module> modules=moduleservice.findAll();
		session.setAttribute("modules", modules);
		return "/module/index";
	}
	@RequestMapping("/startM")
	public String start(@RequestParam(value="moduleId",required=false)String[] moduleIds,HttpSession session){
		
		if(moduleIds!=null){
			moduleservice.changeState(1,moduleIds);
		}
		List<Module> modules=moduleservice.findAll();
		session.setAttribute("modules", modules);
		return "/module/edit2";
	}
	@RequestMapping("/stopM")
	public String stop(@RequestParam(value="moduleId",required=false)String[] moduleIds,HttpSession session){
		
		if(moduleIds!=null){
			moduleservice.changeState(0,moduleIds);
		}
		List<Module> modules=moduleservice.findAll();
		session.setAttribute("modules", modules);
		return "/module/edit2";
	}
	@RequestMapping("/deleteM")
	public String delete(){
		return "/module/delete";
	}
	@RequestMapping("/deleteMf")
	public String deletefact(@RequestParam(value="moduleId",required=false)String[] moduleIds,HttpSession session){
		if(moduleIds!=null){
			moduleservice.delete(moduleIds);
		}
		List<Module> modules=moduleservice.findAll();
		session.setAttribute("modules", modules);
		return "/module/delete";
	}
	@RequestMapping("/insertM")
	public String InsertM(){
		return "/module/add";
	}
	@RequestMapping("/saveM")
	public String saveM(Module module,HttpSession session){
		moduleservice.save(module);
		List<Module> modules=moduleservice.findAll();
		session.setAttribute("modules", modules);
		return "/module/indexIN";
	}
	@RequestMapping("/editM")
	public String EditM(){
		return "/module/edit2";
	}
	@RequestMapping("/editM2")
	public String editM(String moduleId,Model model){
		
		Module module = moduleservice.findOne(moduleId);
		
		model.addAttribute("module",module);
		
		return "/module/edit";
	}
	@RequestMapping("/updateM")
	public String UpdateM(Module module,HttpSession session){
		moduleservice.update(module);
		List<Module> modules=moduleservice.findAll();
		session.setAttribute("modules", modules);
		return "/module/edit2";
	}
}
