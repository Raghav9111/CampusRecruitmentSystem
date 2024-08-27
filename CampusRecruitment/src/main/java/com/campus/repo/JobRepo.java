package com.campus.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.campus.entities.Company;
import com.campus.entities.Job;

@Repository
public interface JobRepo extends JpaRepository<Job, Integer>{

	Optional<List<Job>> findAllByCompany(Company company);
	
	@Query("select u from Job u where company=?1 and activeStatus=?2")
	Optional<List<Job>> findByCompanyAndActiveStatus(Company company, Boolean activeStatus);
	
//	@Query("select j from Job j where title=?")
//	Optional<List<Job>> findByJobName(String title);
}
