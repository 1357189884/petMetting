package cn.tedu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GetImageController {

	@RequestMapping("/getImage")
	public void getImage(String imgurl,HttpServletRequest request,HttpServletResponse response) {
		try {
			request.getRequestDispatcher(imgurl).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
