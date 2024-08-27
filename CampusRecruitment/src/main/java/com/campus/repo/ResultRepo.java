package com.campus.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.campus.entities.JobSeeker;
import com.campus.entities.Result;

@Repository
public interface ResultRepo extends JpaRepository<Result, Integer>{
	Optional<List<Result>> findByJobseeker(JobSeeker jobseeker);
}
