package com.campus.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.entities.Candidates;
import com.campus.entities.Company;
import com.campus.entities.Job;
import com.campus.entities.JobSeeker;
import com.campus.repo.CandidateRepo;
import com.campus.repo.JobRepo;

@Service
public class CandidatesService {

	@Autowired
	private CandidateRepo canRepo;
	
	@Autowired
	private JobRepo jobRepo;
	
	public Boolean checkApplyStatus(Integer jid, JobSeeker jobseeker) {
		Candidates candidate = null;
		Job job = jobRepo.findById(jid).get();
		Optional<Candidates> opt = canRepo.findByJobSeekerAndJob(jobseeker, job);
		if(opt.isPresent()) {
			candidate = opt.get();
			return true;
		}
		else {
			System.out.println("Nhi h");
			candidate = null;
			return false;
		}
		
	}

	public List<Candidates> getCandidatesByCompanyAndNotSelected(Company company) {
		Optional<List<Candidates>> opt = canRepo.findByCompanyAndStatus(company, false);
		if(opt.isPresent()) {
			return opt.get();
		}else {
			return null;
		}
	}

	public List<Candidates> getCandidatesByCompanyAndSelected(Company company) {
		Optional<List<Candidates>> opt = canRepo.findByCompanyAndStatus(company, true);
		if(opt.isPresent()) {
			return opt.get();
		}else {
			return null;
		}
	}

	public Candidates updateCandidate(Integer scId) {
		Candidates candidate = canRepo.findById(scId).get();
		candidate.setStatus(true);
		candidate = canRepo.save(candidate);
		return candidate;
	}

}
