package cn.tedu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
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


@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	/**
	 * 转向到登录界面
	 * @return
	 */
	@RequestMapping("/tologin")
	public String tologin(){
		return "/sysadmin/login/login";
	}
	
	/**
	 * 登录功能实现
	 * @param username 用户名
	 * @param password 密码
	 * @param model
	 * @param response
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/login")
	public String login(String username,String password,Model model,HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException{
		
		if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
			model.addAttribute("msg", "用户名或密码不能为空!");
			return "/sysadmin/login/login";
		}
		//进行md5加密
		password = Md5Utils.getMd5(password, username);
		User user = userService.login(username,password);
		if(user==null){
			model.addAttribute("msg", "用户名或密码不正确!");
			return "/sysadmin/login/login";
		} else {
			if ("true".equals(request.getParameter("remname"))) {
				Cookie cookie = new Cookie("remname", URLEncoder.encode(
						username, "utf-8"));
				cookie.setMaxAge(3600 * 24 * 30);
				cookie.setPath(request.getContextPath() + "/");
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("remname", "");
				cookie.setMaxAge(0);
				cookie.setPath(request.getContextPath() + "/");
				response.addCookie(cookie);
			}
			if ("true".equals(request.getParameter("autologin"))) {
				Cookie autoCk = new Cookie("autologin", URLEncoder.encode(
						username + ":" + password, "utf-8"));
				autoCk.setPath(request.getContextPath() + "/");
				autoCk.setMaxAge(3600 * 24 * 30);
				response.addCookie(autoCk);
			} else {
				Cookie autoCk = new Cookie("autologin", "");
				autoCk.setPath(request.getContextPath() + "/");
				autoCk.setMaxAge(0);
				response.addCookie(autoCk);
			}
			//登录成功，将其存到session中
			request.getSession().setAttribute("_CURRENT_USER", user);
			return "redirect:/home";
		}
	}
	
	/**
	 * 注销
	 * @param session
	 */
	@RequestMapping("/logout.action")
	public void logouot(HttpSession session) {
		session.invalidate();
	}
	
}
