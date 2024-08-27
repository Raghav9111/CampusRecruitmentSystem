package com.campus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.campus.entities.Company;
import com.campus.entities.Exam;
import com.campus.entities.Job;
import com.campus.entities.JobSeeker;
import com.campus.entities.Question;
import com.campus.entities.Result;
import com.campus.entities.User;
import com.campus.model.JsUpdateModel;
import com.campus.model.SaveResultModel;
import com.campus.services.CandidatesService;
import com.campus.services.CompanyService;
import com.campus.services.ExamService;
import com.campus.services.JobSeekerService;
import com.campus.services.JobService;
import com.campus.services.QuestionService;
import com.campus.services.ResultService;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/jobseeker")
public class JobseekerController 
{
	@Autowired
	private CompanyService cmpService;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private JobSeekerService jsService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private ExamService examService;
	
	@Autowired
	private ResultService resService;
	
	@Autowired
	private CandidatesService candidateService;
	
	@RequestMapping("/home")
	   public String home() 
	   {
	       return "JobSeeker/home";
	   }

	@RequestMapping("/instructions/{jid}")
	   public String instructions(@PathVariable(name="jid") Integer jid,ModelMap map) 
	   {	
			Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = (User)obj;
			JobSeeker jobseeker = jsService.getByUser(user);
			Boolean res = candidateService.checkApplyStatus(jid, jobseeker);
			map.addAttribute("check", res);
			map.addAttribute("jid", jid);
	       return "JobSeeker/Instructions";
	   }
	
	 @RequestMapping("/companies")
	   public String companies(ModelMap map) 
	   {
		 List<Company> cmpList = cmpService.getAllCompanies();
			System.out.println(cmpList);
			map.addAttribute("cmpList",cmpList);
	       return "JobSeeker/ViewCompanies";
	   }

	@RequestMapping("/view_company/{cid}")
	public String viewCompany(@PathVariable(name="cid") Integer cid, ModelMap map)
	{
		Company company =  cmpService.getByID(cid);
		List<Job> jobList = jobService.getAllActiveJobs(company);
		map.addAttribute("company", company);
		map.addAttribute("jobList",jobList);
		return "JobSeeker/ViewCompany";
	}
	
	@RequestMapping("/js_profile")
	public String viewProfile(ModelMap model)
	{
		   Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   User user = (User)obj;
		   JobSeeker jobseeker = jsService.getByUser(user);
		   model.addAttribute("user",user);
		   model.addAttribute("jobseeker",jobseeker);
		   return "JobSeeker/JobSeekerProfile";
	}
	
	@RequestMapping("/update_profile")
	public String updateProfile(JsUpdateModel model)
	{
		   Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   User user = (User)obj;
		   
		   JobSeeker jobseeker = jsService.getByUser(user);
		   try
		   {
			   jobseeker.updateJobseeker(model);
			   jsService.updateJobseeker(jobseeker);
			   return "redirect:/jobseeker/js_profile";
		   }
		   catch (Exception e) 
		   {
			   System.out.println(e);
			return"error";
	       }
	}
	

	@RequestMapping("/test/{jid}")
	public String test(@PathVariable(name="jid") Integer jid, ModelMap map) {
		Job job = jobService.getJobById(jid);
		Exam exam = examService.getByJob(job);
		List<Question> qlist = questionService.getQuestionByExam(exam);
		map.addAttribute("qlist", qlist);
		map.addAttribute("job", job);
		return "JobSeeker/Test";
		
	}
	@RequestMapping(value="/save_result/{jid}",  method=RequestMethod.POST)
	public String saveResult(@PathVariable (name="jid") Integer jid, SaveResultModel resModel) {
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)obj;
		System.out.println(user);
		JobSeeker jobSeeker = jsService.getByUser(user);	
		System.out.println(jobSeeker);
		Job job = jobService.getJobById(jid);
		Exam exam = examService.getByJob(job);
		
		Boolean res = resService.checkAndSaveResult(resModel,job,exam,jobSeeker);
		
		return "JobSeeker/AllJobs";
	}
	
	@RequestMapping("/jobs")
	public String getAllJobs(ModelMap model)
	{
		List<Job> jobs = jobService.getAllJobs(); 
		model.addAttribute("jlist", jobs);
		return "JobSeeker/AllJobs";
	}
	
	@RequestMapping("/result")
	public String showResult(ModelMap map)
	{
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)obj;
		JobSeeker jobseeker = jsService.getByUser(user);
		List<Result> rlist =resService.findByJobseeker(jobseeker);
		map.addAttribute("rlist", rlist);
		return "JobSeeker/Result";
	}
	
	
}
