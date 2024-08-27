package com.campus.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.campus.entities.Candidates;
import com.campus.entities.Company;
import com.campus.entities.Job;
import com.campus.entities.JobSeeker;

@Repository
public interface CandidateRepo extends JpaRepository<Candidates, Integer>{
	@Query("select u from Candidates u where jobseeker_id=?1 and job_id=?2")
	Optional<Candidates> findByJobSeekerAndJob(JobSeeker jobSeeker, Job job);
	
	@Query("select u from Candidates u where company_id=?1 and status=?2")
	Optional<List<Candidates>> findByCompanyAndStatus(Company company, Boolean status);
}
