package com.campus.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.campus.entities.Exam;
import com.campus.entities.Job;

@Repository
public interface ExamRepo extends JpaRepository<Exam, Integer>{
	Optional<Exam> findByJob(Job job);
}
