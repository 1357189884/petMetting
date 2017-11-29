package cn.tedu.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tedu.pojo.User;
import cn.tedu.service.UserService;
import cn.tedu.utils.Md5Utils;
import cn.tedu.utils.VerifyCode;

@Controller
public class RegistController {

	@Autowired
	private UserService userService;

	/**
	 * 跳转到注册页面
	 * 
	 * @return
	 */
	@RequestMapping("/toregist")
	public String toregist() {
		return "/sysadmin/register/regist";
	}

	/**
	 */
	@RequestMapping("/regist")
	public String regist(User user, Model model, HttpSession session, HttpServletRequest request) {

		if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
			model.addAttribute("msg", "用户名或密码不能为空!");
			return "/sysadmin/register/regist";
		}
		if (StringUtils.isEmpty(user.getEmail())) {
			model.addAttribute("msg", "邮箱不能为空!");
			return "/sysadmin/register/regist";
		}
		if (StringUtils.isEmpty(user.getVerifyCode())) {
			model.addAttribute("msg", "验证码不能为空!");
			return "/sysadmin/login/login";
		}
		if (!user.getEmail().matches("^\\w+@\\w+(\\.[a-z]+)+$")) {
			model.addAttribute("msg", "邮箱格式不匹配!");
			return "/sysadmin/register/regist";
		}
		// 获取验证码
		String code = (String) session.getAttribute("code");
		System.out.println(code);
		System.out.println(user.getVerifyCode());
		if (!user.getVerifyCode().equalsIgnoreCase(code)) {
			model.addAttribute("msg", "验证码不正确!");
			return "/sysadmin/register/regist";
		}
		User userCustom = userService.find(user.getUsername());
		if (userCustom != null) {
			model.addAttribute("msg", "用户名已存在!");
			return "/sysadmin/register/regist";
		} else {
			user.setPassword(Md5Utils.getMd5(user.getPassword(), user.getUsername()));
			user.setUserId(UUID.randomUUID().toString());
			userService.saveUser(user);
			model.addAttribute("msg", "注册成功！点击这里登陆");
			return "/sysadmin/login/login";
		}
	}
	

}





