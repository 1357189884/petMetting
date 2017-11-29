package cn.tedu.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.tedu.pojo.Order;
import cn.tedu.pojo.Pet;
import cn.tedu.service.PetService;
import cn.tedu.utils.Page;

@RequestMapping("/pet")
@Controller
public class PetController extends BaseController {
	@Autowired
	private PetService petService;
	
	@RequestMapping("/petInfo")
	public String petInfo(Model model,String petId) {
		
		Pet pet = petService.findOne(petId);
		model.addAttribute("pet", pet);
		return "product/petInfo";
	}
	
	@RequestMapping("/show")
	public String show(Model model) {
		List<Pet> pets = petService.findAll();
		model.addAttribute("pets", pets);
		return "home/index";
	}
	
	@RequestMapping("/petList")
	public String petList(String pageNow,Model model) {
		Page page=null;
		List<Pet> pets = null;
		int petCount =(int)petService.getPetCount();
		 if (pageNow != null) {  
		        page = new Page(petCount, Integer.parseInt(pageNow));  
		         pets = petService.findAllPets(page.getStartPos(),  page.getPageSize());
		    } else {  
		        page = new Page(petCount, 1);  
		        pets = petService.findAllPets(page.getStartPos(),  page.getPageSize());
		    }  
		model.addAttribute("pets",pets );
		model.addAttribute("page", page);
		return  "pet/petList";
		
	}

	@RequestMapping("/select")
	public String select(String petId, Model model) {
		if (petId != null && petId.length() > 0) {

			Pet pet = petService.findOne(petId);
			if (pet == null || pet.getPetId().length() == 0) {
				model.addAttribute("errorInfo", "亲，没有找到此宠物编号!");
			}
			model.addAttribute("pet", pet);
			return "/petSelect";
		}
		return "redirect:/petList";

	}

	@RequestMapping("/back")
	public String back() {
		return "redirect:petList";
	}

	@RequestMapping("/petDelete")
	public String petDelete(Model model) {
		List<Pet> pets = petService.findAll();
		model.addAttribute("pets", pets);
		return "pet/petDelete";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam(value = "petId", required = false) String[] petIds) {
		if (petIds != null && petIds.length > 0) {
			petService.delete(petIds);
		}
		return "redirect:petDelete";
	}

	@RequestMapping("/petAdd")
	public String petAdd() {
		
		return "pet/petAdd";
	}
	/**
	 * 增加宠物
	 * @param pet
	 * @param request
	 * @param picFile  图片对象
	 * @param model
	 * @return
	 */
	@RequestMapping("/save")
	public String save(Pet pet,HttpServletRequest request,
			MultipartFile picFile,Model model) {
		if (pet.getPetName().length() == 0) {
			model.addAttribute("errorInfo", "宠物名不能为空!");
			return "pet/petAdd";
		}
		
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
		
		if(picFile != null) {
			//得到原始图片名称
			String originalFilename = picFile.getOriginalFilename();
			String newFileName = UUID.randomUUID() + 
				originalFilename.substring(originalFilename.indexOf("."));
			File file = new File(path);
			file.mkdirs();
			
			File file1 = new File(path+newFileName);
			try {
				picFile.transferTo(file1);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			String imgurl = path.split("webapp")[1] + newFileName;
			
			pet.setImgurl(imgurl);
		
			petService.save(pet);
			model.addAttribute("msg", "添加成功");
		}
		
		return "redirect:petList";
	}

	@RequestMapping("/uploadPic")
	public String uploadPic(Pet pet,HttpServletRequest request,
			MultipartFile picFile,Model model) throws Exception{
			
        return "redirect:upload";
	}
	
	
	@RequestMapping("/noheal")
	public String noheal(@RequestParam(value = "petId", required = false) String[] petIds) {

		if (petIds != null && petIds.length > 0) {
			petService.changeHealth(0, petIds);
		}
		return "redirect:petEdit";
	}

	@RequestMapping("/heal")
	public String heal(@RequestParam(value = "petId", required = false) String[] petIds) {
		if (petIds != null && petIds.length > 0) {
			petService.changeHealth(1, petIds);
		}
		return "redirect:petEdit";
	}

	@RequestMapping("/petEdit")
	public String petEdit(Model model) {
		List<Pet> pets = petService.findAll();
		model.addAttribute("pets", pets);
		return "pet/petEdit";
	}

	@RequestMapping("/update")
	public String update(String petId, Model model) {
		if (petId != null && petId.length() > 0 && petId.matches(",?[\\w-]+")) {
			if (petId.charAt(0) == ',') {
				String petId2 = petId.substring(1);
				petId = petId2;
			}

			Pet pet = petService.findOne(petId);
			if (pet == null || pet.getPetId().length() == 0) {
				model.addAttribute("errorInfo", "亲，没有找到此宠物编号!");
			}
			model.addAttribute("pet", pet);
			return "pet/petEdit2";
		}
		return "redirect:/petEdit";
	}

	@RequestMapping("/toupdate")
	public String toupdate(Pet pet) {
		petService.update(pet);
		return "redirect:petEdit";
	}
}
