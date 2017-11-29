package cn.tedu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.session.Session;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.tedu.pojo.PetShow;
import cn.tedu.pojo.Product1;
import cn.tedu.pojo.User;
import cn.tedu.service.BackProdService;


@Controller
@RequestMapping("/product")
public class ProdController {
	@Autowired
	private BackProdService service;
	@RequestMapping("/index")
	public String find(Model model) {
		List<Product1> prodList = service.findAll();
		model.addAttribute("prodList", prodList);
		return "/product/index";

	}

	@RequestMapping("/select")
	public String findOne(String productId, Model model) {
		if (productId != null && productId.length() > 0) {
			if (productId.charAt(0) == ',') {
				String userId2 = productId.substring(1);
				productId = userId2;
			}
			Product1 prod = service.findOne(productId);
			model.addAttribute("prod", prod);
			return "/product/findo";
		}
		return "redirect:/product/index";

	}
	@RequestMapping("/add")
	public String addOne(Model model) {
		List<Product1> prodList = service.findAll();
		model.addAttribute("prodList", prodList);
		
		return "/product/addList";

	}
	@RequestMapping("addlis")
	public String jump(){
		return "/product/add";
	}

	
	@RequestMapping("/save")
	public String upload(Product1 prod,HttpServletRequest request,
			MultipartFile picFile,Model model) throws Exception{
		System.out.println(prod);
		//到指定文件夹下生成目录
		String pic_path=request.getSession().getServletContext().getRealPath("\\")+"WEB-INF/img";
		String hc = Integer.toHexString(UUID.randomUUID().hashCode());
		int i = 8 - hc.length();
		for (int j = 0; j < i; j++) {
			hc = "0" + hc;
		}
		String path = pic_path;
		for (char c : hc.toCharArray()) {
			path = path + "/" + c;
		}
		System.out.println(111);
		
		if(picFile != null&&picFile.getSize()!=0) {
			//得到原始图片名称
			String originalFilename = picFile.getOriginalFilename();
			String newFileName = UUID.randomUUID() + 
				originalFilename.substring(originalFilename.indexOf("."));
			File file = new File(path);
			file.mkdirs();
			
			File file1 = new File(path+newFileName);
			picFile.transferTo(file1);
			
			String imgurl = path.split("webapp")[1] + newFileName;
			
			
			prod.setImgurl(imgurl);
			if(prod.getName()!=null&&prod.getName().length()!=0){
				service.add(prod);
				return "redirect:/product/add";
			}
			}
		model.addAttribute("msg","用户名不能为空");
		
		return "product/add";
	}
	@RequestMapping("/index1")
	public String li(Model model) {
		List<Product1> prodList = service.findAll();
		model.addAttribute("prodList", prodList);
		return "/product/index1";

	}
	@RequestMapping("/remove")
	public String re(Model model) {
		List<Product1> prodList = service.findAll();
		model.addAttribute("prodList", prodList);

		return "/product/remove";

	}

	@RequestMapping("/removes")
	public String remove(@RequestParam(value = "productId", required = false) String[] ids,Model model) {
		if (ids != null&&ids.length!=0) {
			service.removes(ids);
		}
	
		return "redirect:/product/remove";
	}
	
	@RequestMapping("/change")
	public String show(Model model) {
		List<Product1> prodList = service.findAll();
		model.addAttribute("prodList", prodList);
		return "product/show";

	}

	@RequestMapping("/updata")
	public String update(String productId, Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		if (productId != null && productId.length() > 0) {
			if (productId.charAt(0) == ',') {
				String userId2 = productId.substring(1);
				productId = userId2;
			}

		Product1 prod= service.findOne(productId);
			model.addAttribute("prod", prod);
			return "/product/edit";
		}
		
		return "redirect:/product/change";

	}

//	@RequestMapping("/saving")
//	public String saving(Product1 prod) {
//		service.update(prod);
//		return "redirect:/product/change";
//
//	}
	@RequestMapping("/saving")
	public String uploadPic(Product1 prod,HttpServletRequest request,
			MultipartFile picFile,Model model) throws Exception{
		System.out.println(prod);
		//到指定文件夹下生成目录
		String pic_path=request.getSession().getServletContext().getRealPath("\\")+"WEB-INF/img";
		String hc = Integer.toHexString(UUID.randomUUID().hashCode());
		int i = 8 - hc.length();
		for (int j = 0; j < i; j++) {
			hc = "0" + hc;
		}
		String path = pic_path;
		for (char c : hc.toCharArray()) {
			path = path + "/" + c;
		}
		System.out.println(111);
		
		if(picFile != null&&picFile.getSize()!=0) {
			//得到原始图片名称
			String originalFilename = picFile.getOriginalFilename();
			String newFileName = UUID.randomUUID() + 
				originalFilename.substring(originalFilename.indexOf("."));
			File file = new File(path);
			file.mkdirs();
			
			File file1 = new File(path+newFileName);
			picFile.transferTo(file1);
			
			String imgurl = path.split("webapp")[1] + newFileName;
			
			
			prod.setImgurl(imgurl);
		
			service.update(prod);
		}else{
			String img=service.findone(prod);
			String imgurl=img;
			prod.setImgurl(imgurl);
			service.update(prod);
		}	
		
		return "redirect:/product/change";
	}
	
}
