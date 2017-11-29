package cn.tedu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tedu.pojo.PetShow;
import cn.tedu.service.PetShowService;

@RequestMapping("/petshow")
@Controller
public class PetShowController extends BaseController {
	
	@Autowired
	private PetShowService petShowService;
	
	@RequestMapping("/show")
	public String show(Model model) {
		List<PetShow> list = petShowService.findAll();
		model.addAttribute("petShowList", list);
		return "home/index";
	}
	
	@RequestMapping("/content")
	public String content(Model model,String id) {
		
		PetShow petShow = petShowService.findById(id);
		model.addAttribute("pet", petShow);
		return "pet_show/pet_show_content";
	}
}
