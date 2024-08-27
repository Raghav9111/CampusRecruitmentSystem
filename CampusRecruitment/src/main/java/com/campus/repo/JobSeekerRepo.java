package com.campus.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.campus.entities.Company;
import com.campus.entities.JobSeeker;
import com.campus.entities.User;

@Repository
public interface JobSeekerRepo extends JpaRepository<JobSeeker, Integer>{
	Optional<JobSeeker> findByUser(User user);
}
