package com.campus.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.entities.Company;
import com.campus.entities.Job;
import com.campus.model.AddJobModel;
import com.campus.model.UpdateJobModel;
import com.campus.repo.JobRepo;

@Service
public class JobService {

	@Autowired
	private JobRepo jobRepo;
	public String addJob(Company company, AddJobModel model)
	{
		try 
		{
			Job job = new Job(model.getTitle(), model.getDescription(), model.getVacancies(), model.getLocation(), model.getExpectedSalary(), model.getExperience(),false, model.getTechnologyRequired(), company, true);
			jobRepo.save(job);
			return"success";
		}
		catch (Exception e)
		{
			return "failed";
		}
	}
	public List<Job> getJobs(Company company) {
		Optional<List<Job>> obj = jobRepo.findAllByCompany(company);
		if(obj.isPresent()) {
			return obj.get();
		}
		else {
			return null;
		}
		
	}
	public Job getJobById(Integer jid) {
		return jobRepo.findById(jid).get();
	}
	public void updateJob(Job job) {
		jobRepo.save(job);
	}
	public List<Job> getAllActiveJobs(Company company) {
		Optional<List<Job>> obj = jobRepo.findByCompanyAndActiveStatus(company, true);
		if(obj.isPresent()) {
			return obj.get();
		}
		else {
			return null;
		}
	}
	
	public List<Job> getAllJobs() {
		return jobRepo.findAll();
	}
	
	
//	public List<Job> getJobByName(String jobName) {
//		return jobRepo.findByJobName(jobName).get();
//	}

}
