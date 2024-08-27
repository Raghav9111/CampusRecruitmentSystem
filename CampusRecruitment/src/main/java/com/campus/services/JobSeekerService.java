package com.campus.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.entities.JobSeeker;
import com.campus.entities.User;
import com.campus.model.JsRegisterModel;
import com.campus.repo.JobSeekerRepo;

@Service
public class JobSeekerService {

	@Autowired
	private UserService userService;
	
	@Autowired
	private JobSeekerRepo jsRepo;
	
	public String saveJobSeeker(JsRegisterModel model) 
	{
		try
		{
			User user = userService.saveUser(model.getEmail(),model.getPassword(),"ROLE_JOBSEEKER");
			
		    if(user!=null)
		    {
		    	JobSeeker jobSeeker = new JobSeeker(model.getName(), model.getContact(), model.getAddress(), model.getResume(), model.getRole(), model.getSkills(), model.getDescription(), user);
		    	jsRepo.save(jobSeeker);
		    	return "success";
		    }
		    else
		    {
		    	System.out.println("User is null");
		    	return "failed";
		    }
		}
		catch (Exception e)
		{
			return "failed";
		}
		
	}

	public JobSeeker getByUser(User user) {
		return jsRepo.findByUser(user).get();
	}

	public void updateJobseeker(JobSeeker jobseeker) {
		jsRepo.save(jobseeker);
		
	}
	public JobSeeker getById(Integer jId) {
		// TODO Auto-generated method stub
		return jsRepo.findById(jId).get();
	}


}
