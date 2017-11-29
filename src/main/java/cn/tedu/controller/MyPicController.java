package cn.tedu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.tedu.pojo.PetShow;
import cn.tedu.service.MyPicService;
import cn.tedu.service.PetShowService;

@RequestMapping("/pic")
@Controller
public class MyPicController extends BaseController{
	
	@Autowired
	private MyPicService myPicService;
	@Autowired
	private PetShowService petShowService;
	
	@RequestMapping("/manager")
	public String manager(Model model) {
		
		List<PetShow> list = petShowService.findAll();
		model.addAttribute("petShowList", list);
		
		return "pic/index";
	}
	
	/**
	 * 编辑
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(Model model,String id) {
		
		PetShow petShow = petShowService.findById(id);
		model.addAttribute("petshow", petShow);
		return "pic/edit";
	}
	
	@RequestMapping("/editSubmit")
	public String editSubmit(PetShow petShow) {
		
		petShowService.insert(petShow);
		
		return "redirect:manager";
	}
	
	@RequestMapping("/download")
	public String download(Model model) {
		
		List<PetShow> list = petShowService.findAll();
		
		model.addAttribute("petShowList", list);
		return "pic/index_download";
	}
	
	@RequestMapping("/downloadPic")
	public void downloadPic(Model model,String imgurl,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		//得到图片名称
		String fileName = imgurl.substring(imgurl.lastIndexOf("/"));
		//得到图片真实路径
		String path = request.getSession().getServletContext().getRealPath(imgurl);
		//设置浏览器显示的内容类型为Zip  (很重要,欺骗浏览器下载的是zip文件,就不会自己打开了)  
		response.setContentType("application/zip");  
	    //设置内容作为附件下载  fileName有后缀,比如1.jpg  
	    response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(fileName, "utf-8"));  
	    ServletOutputStream out = null;  
	    try {  
	        // 通过文件路径获得File对象(假如此路径中有一个download.pdf文件)  
	        InputStream inputStream = new FileInputStream(path);
	        // 3.通过response获取ServletOutputStream对象(out)  
	        out = response.getOutputStream();  
	        int b = 0;  
	        byte[] buffer = new byte[1024];  
	        while ((b = inputStream.read(buffer)) != -1) {  
	            // 4.写到输出流(out)中  
	            out.write(buffer, 0, b);  
	        }  
	        inputStream.close();  
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    } finally {  
	        try {  
	            if (out != null)  
	            out.close();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	        try {  
	            if (out != null)  
	            out.flush();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	    }  
	}
	
	@RequestMapping("/upload")
	public String upload() {
		return "pic/index_upload";
	}
	
	@RequestMapping("/uploadPic")
	public String uploadPic(PetShow petShow,HttpServletRequest request,
			MultipartFile picFile,Model model) throws Exception{
		System.out.println(petShow);
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
		
		if(picFile != null) {
			//得到原始图片名称
			String originalFilename = picFile.getOriginalFilename();
			String newFileName = UUID.randomUUID() + 
				originalFilename.substring(originalFilename.indexOf("."));
			File file = new File(path);
			file.mkdirs();
			
			File file1 = new File(path+newFileName);
			picFile.transferTo(file1);
			
			String imgurl = path.split("webapp")[1] + newFileName;
			
			petShow.setImgurl(imgurl);
		
			myPicService.insertImgUrl(petShow);
		}	
		model.addAttribute("msg", "添加成功");
        return "redirect:upload";
	}
	
}
