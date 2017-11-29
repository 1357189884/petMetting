package cn.tedu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tedu.pojo.User;
import cn.tedu.service.BackUserService;


@Controller
public class UserController extends BaseController {
	@Autowired
	private BackUserService service;
	@RequestMapping("/user/index")
	public String find(Model model) {
		List<User> userList = service.findAll();
		model.addAttribute("userList", userList);
		return "/user/findList";

	}

	@RequestMapping("/user/select")
	public String findOne(String userId, Model model) {
		if (userId != null && userId.length() > 0) {
			if (userId.charAt(0) == ',') {
				String userId2 = userId.substring(1);
				userId = userId2;
			}
			User user1 = service.findOne(userId);
			model.addAttribute("user", user1);
			return "/user/findo";
		}	
		return "redirect:/user/index";

	}

	@RequestMapping("/user/add")
	public String addOne() {

		return "/user/add";

	}

	@RequestMapping("/user/save")
	public String Creat(User user, Model model) {
		if (user.getUsername().length() == 0) {
			String msg="用户名不能为空";
			String info="密码不能为空";
			model.addAttribute("msg",msg);
			model.addAttribute("info",info);
			return "/user/add";
		}
		service.add(user);
		return "redirect:/user/index";
	}
	@RequestMapping("/user/return")
	public String returning(){
		return "/user/add";
	}

	@RequestMapping("/user/remove")
	public String re(Model model) {
		List<User> userList = service.findAll();
		model.addAttribute("userList", userList);

		return "/user/remove";

	}

	@RequestMapping("/user/removes")
	public String remove(@RequestParam(value = "userIde", required = false) String[] ids) {
		if (ids != null&& ids.length > 0) {
			service.removes(ids);
		}
		return "redirect:/user/remove";

	}

	@RequestMapping("/user/edit")
	public String show(Model model) {
		List<User> userList = service.findAll();
		model.addAttribute("userList", userList);
		return "/user/show";

	}

	@RequestMapping("/user/updata")
	public String update(String userId, Model model) {
		if (userId != null && userId.length() > 0) {
			if (userId.charAt(0) == ',') {
				String userId2 = userId.substring(1);
				userId = userId2;
			}

			User user = service.findOne(userId);
			model.addAttribute("user", user);
			return "/user/edit";
		}

		return "redirect:/user/edit";

	}

	@RequestMapping("/user/saving")
	public String saving(User user) {
		service.update(user);
		return "redirect:/user/edit";

	}
	@RequestMapping("/user/stop")
	public String stop(@RequestParam(value="userId",required=false)String[] ids){
		
		if (ids!=null) {
			service.changeState(0,ids);
		}
		
		return "redirect:/user/edit";
	}
	
	@RequestMapping("/user/start")
	public String start(@RequestParam(value="userId",required=false)String[] ids){
		
		if (ids!=null) {
			service.changeState(1,ids);
		}
		
		return "redirect:/user/edit";
	}
	
}
