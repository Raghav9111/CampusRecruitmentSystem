package com.campus.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.campus.entities.User;
import com.campus.model.CompanyRegisterModel;
import com.campus.model.JsRegisterModel;
import com.campus.services.CompanyService;
import com.campus.services.JobSeekerService;


@Controller
@RequestMapping("/web")
public class WebController
{
	
	@Autowired
	private JobSeekerService jsService;
	
	@Autowired
	private CompanyService cmpService;
	
	@RequestMapping(value="/")
	public String h() {
		return "CompanyRegister";
	}
	
	@RequestMapping(value="/register_js")
	public String registerCall()
	{
		return "JSRegister";
	}
	
	@RequestMapping(value="/register_company")
	public String registerCompany()
	{
		return "CompanyRegister";
	}
	
	
	@RequestMapping(value = "/login" )	
	public String login(ModelMap model, String error, String logout) 
	{
		model.addAttribute("errorMsg", "  ");
		if (error != null)
		{
			model.addAttribute("errorMsg", "Your username and password are invalid.");
		}
		if (logout != null)
			model.addAttribute("msg", "You have been logged out successfully.");

		return "login";
	}
	
	@RequestMapping(value="/reg_js" )
	public String regJs(@RequestParam("file")MultipartFile multipartFile,@RequestParam("profile") MultipartFile profile, JsRegisterModel model) 
	{   
		String res = null;
		final String baseDir = "E:\\CampusRecruitment";
		byte data[];
		try {
			data = multipartFile.getBytes();
			String filePath = "";
			
			String fileName = multipartFile.getOriginalFilename();
			String fileType = multipartFile.getContentType();
			
			String extension = fileName.substring(fileName.lastIndexOf("."));
			String uploadFile = UUID.randomUUID().toString()+extension;
			
			File dir = new File(baseDir,"resume");
			if(!dir.exists()) // Check Folder Existence; 
			{
				dir.mkdir();
			}
			
			File file = new File(dir, uploadFile);
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(data);
			fos.flush();
			fos.close();
			
			filePath =  file.getAbsolutePath();
			System.err.println(filePath);
			model.setResume(filePath);
			
			
			
			
			res = jsService.saveJobSeeker(model);
			if(res.equals("success"))
			{
				return "/login";
			}
			else {
				return "error";
			}
		}
		catch (Exception e) {
			return "error";
		}
	}
	
	@RequestMapping("/reg_cmp")
	public String regCmp(@RequestParam("file")MultipartFile multipartFile, CompanyRegisterModel model)
	{ 
		String res = null;
		final String baseDir = "E:\\CampusRecruitment";
		byte data[];
		try {
			data = multipartFile.getBytes();
			String filePath = "";
			
			String fileName = multipartFile.getOriginalFilename();
			String fileType = multipartFile.getContentType();
			
			String extension = fileName.substring(fileName.lastIndexOf("."));
			String uploadFile = UUID.randomUUID().toString()+extension;
			
			File dir = new File(baseDir,"files");
			if(!dir.exists()) // Check Folder Existence; 
			{
				dir.mkdir();
			}
			
			File file = new File(dir, uploadFile);
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(data);
			fos.flush();
			fos.close();
			
			filePath =  file.getAbsolutePath();
			System.err.println(filePath);
			model.setCertificate(filePath);
			
			
			
			res = cmpService.saveCompany(model);
			if(res.equals("success"))
			{
				return "/login";
			}
			else {
				return "error";
			
			}
		}catch (Exception e) {
			return "error";
		}
	}
	
	
	@RequestMapping(value="/home")
	public String home(){
		System.out.println("Home aaye");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)principal;
		System.out.println(user);
		if(user.getRole().equals("ROLE_JOBSEEKER"))
			return "JobSeeker/home";
		else if(user.getRole().equals("ROLE_COMPANY")){
			return "Company/home";
		}
		else if(user.getRole().equals("ROLE_ADMIN"))
			return "Admin/home";
		else {
			return "error";
		}
		
	}
	@RequestMapping(value = "/accessDenied")
	public String accessDenied() {
		return "error";
	}

}
