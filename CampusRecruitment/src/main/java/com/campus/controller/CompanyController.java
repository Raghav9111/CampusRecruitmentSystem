package com.campus.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import org.springframework.http.HttpHeaders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.campus.entities.Candidates;
import com.campus.entities.Company;
import com.campus.entities.Exam;
import com.campus.entities.Job;
import com.campus.entities.JobSeeker;
import com.campus.entities.Question;
import com.campus.entities.User;
import com.campus.model.AddJobModel;
import com.campus.model.CompanyUpdateModel;
import com.campus.model.ExamModel;
import com.campus.model.QuestionModel;
import com.campus.model.QuestionSaveModel;
import com.campus.model.UpdateJobModel;
import com.campus.services.CandidatesService;
import com.campus.services.CompanyService;
import com.campus.services.ExamService;
import com.campus.services.JobSeekerService;
import com.campus.services.JobService;
import com.campus.services.QuestionService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/company")
public class CompanyController
{
	@Autowired
	private CompanyService cmpService;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private JobSeekerService jobseekerService;
	
	@Autowired
	private ExamService examService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private CandidatesService candidatesService;
	
	 @RequestMapping("/home")
	   public String home() 
	   {
	       return "Company/home";
	   }
	 @RequestMapping("/add")
	   public String add() 
	   {
	       return "Company/AddJob";
	   }
	 
	 @RequestMapping("/candidates")
	 public String candidates(ModelMap map)
	 {
		 try{
			 Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			 User user = (User)obj;
			 Company company = cmpService.getByUser(user);
			 List<Candidates> selectclist = null;
			 List<Candidates> clist = null;
			 selectclist = candidatesService.getCandidatesByCompanyAndSelected(company);
			 
			 clist = candidatesService.getCandidatesByCompanyAndNotSelected(company);
			 System.err.println(selectclist);
			 System.err.println(clist);
			 
			 if(selectclist == null) {
				 map.addAttribute("selectclist", null);
			 }
			 else {
				 map.addAttribute("selectclist", selectclist);
			 }
			 
			 if(clist == null) {
				 map.addAttribute("clist", null);
			 }
			 else {
				 map.addAttribute("clist", clist);
			 }
			 
			
			 map.addAttribute("errorMsg", "  ");
			 return "Company/Candidates";
		 }catch (Exception e) {e.printStackTrace();
			System.err.println("Candidate Exception"+e.getMessage());
			map.addAttribute("errorMsg", e.getMessage());
			return "Company/Candidates";
		}
	 }

	 @RequestMapping("/jobs")
	   public String jobs() 
	   {
	       return "Company/AddJob";
	   }
	
	@RequestMapping("/add_job")
	public String addJob(AddJobModel model)
	{
		String res = null;
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)obj;
		Company company = cmpService.getByUser(user);

		res = jobService.addJob(company, model);
        if (res.equals("success")) 
        {
			return "Company/home";
		}
        else 
        {
        	return "error";
		}
	}
	
   @RequestMapping("/view_job")
   public String viewJobs(ModelMap map) 
   {
	    String res = null;
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User)obj;
		Company company = cmpService.getByUser(user);

	    List<Job> jobList =  jobService.getJobs(company);
	    map.addAttribute("jlist",jobList);
       return "Company/AddJob";
   }
   
   @RequestMapping("/edit_job/{jid}")
   public String editJob(@PathVariable(name="jid") Integer jid,ModelMap map) 
   {
	  Job job = jobService.getJobById(jid);
	  System.out.println(job);
	  map.addAttribute("job",job);
       return "Company/ViewJob";
   }
   
   @RequestMapping("/update_job/{jobId}")
   public String updateJob(@PathVariable(name="jobId") Integer jid,UpdateJobModel model)
   {
	   String res = null;
	   try 
	   {
		Job job = jobService.getJobById(jid);
		if(job!=null)
		{
				job.updateJob(model);
				jobService.updateJob(job);
				return "Company/AllJobs";
			
		}
		else
		{
			
			System.out.println("Job is null!");
			return "error";
		}
	   } 
	   catch (Exception e) {
		System.out.println(e);
		return "error";
	}
   }
   
   @RequestMapping("/cmp_profile")
   public String profile(ModelMap model)
   {
	   Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	   User user = (User)obj;
	   Company company = cmpService.getByUser(user);
	   model.addAttribute("user",user);
	   model.addAttribute("company",company);
	   return "Company/CompanyProfile";
   }
   
   
   @RequestMapping("/update_profile")
   public String updateProfile(CompanyUpdateModel model)
   {
	   Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	   User user = (User)obj;
	   Company company = cmpService.getByUser(user);
	   try
	   {
		   company.updateCompany(model);
		   cmpService.updateCompany(company);
		   return "redirect:/company/cmp_profile";
	   }
	   catch (Exception e) 
	   {
		   System.out.println(e);
		return"error";
	}
   }
   @RequestMapping("/add_test/{jId}")
   public String addTest(@PathVariable(name="jId") Integer jId , String param, ModelMap map) {
	  map.addAttribute("jId", jId);
       return "Company/AddExam";
   }
   
   @RequestMapping(value="/add_exam", method=RequestMethod.POST)
   public String addExam(ExamModel model, ModelMap map) {
	   System.out.println(model);
	   map.addAttribute("exam", model);
       return "Company/AddQuestion";
   }
   
   
   @RequestMapping(value= "/save_question/{exam}", method = RequestMethod.POST)
   public String saveQuestion(@PathVariable(name="exam") String examData,QuestionModel questionModel) throws JsonMappingException, JsonProcessingException {
	   
	   
	   ExamModel examModel = examService.covertStringToExamModel(examData);
		
	   
	   System.out.println(examModel);
	   System.out.println(questionModel);
	   
	   Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	   User user = (User)obj;
	   Company company = null;
	   company = cmpService.getByUser(user);
	   if(company != null) {
		   Exam exam = null;
		   exam = examService.saveExam(examModel,company);
		   if(exam != null) {
			   Boolean res = null;
			   res = questionService.saveQuestion(exam,questionModel);
			   if(res) {
				   Job job = jobService.getJobById(examModel.getJId());
				   job.setExam_status(true);
				   jobService.updateJob(job);
				   return "redirect:/company/view_job";
			   }
			   else {
				   System.err.println("Question not save");
				   return "error";
			   }
		   }
		   else {
			   System.err.println("Exam Not Save");
			   return "error";
		   }
	   }
	   else{
		   return "error";
	   }   
   }  
   @RequestMapping("/select_candidate/{scId}")
   public String selectCandidate(@PathVariable(name="scId") Integer scId) {
	   Candidates candidate = candidatesService.updateCandidate(scId);
	   
       return "redirect:/company/candidates";
   }
   
   @RequestMapping("/view_resume/{jid}")
   public ResponseEntity<InputStreamResource> load(@PathVariable(name="jid")Integer jId) 
	{					
				
	    	JobSeeker jobSeeker = jobseekerService.getById(jId);
	    	String path = jobSeeker.getResume();
	    	System.err.println(path);
	    	String constantSubstring = "resume\\";
	    	int constantIndex = path.indexOf(constantSubstring);
	    	int endIndex = path.indexOf(".pdf") + ".pdf".length();
	    	String resume = path.substring(constantIndex + constantSubstring.length(), endIndex);
	    	
	    	HttpHeaders headers = new HttpHeaders();
	    	headers.set("Content-Type", "application/pdf");
		    headers.add("Content-Disposition", "inline; filename="+resume);
			try {
				File file = new File(path);

	         	FileInputStream fis = new FileInputStream(file);            
	            int size = fis.available();
	            byte arr[] = new byte[size];
	            
	            fis.read(arr);
	            fis.close();
	            
	            return ResponseEntity
               .ok()
               .headers(headers)
               .body(new InputStreamResource(new ByteArrayInputStream(arr)));
	            
			} catch (IOException e) 
			{
				System.out.println(e.getMessage());
				return null;
			}
	}
 
}
