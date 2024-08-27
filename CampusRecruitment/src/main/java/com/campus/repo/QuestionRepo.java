package com.campus.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.campus.entities.Exam;
import com.campus.entities.Question;

@Repository
public interface QuestionRepo extends JpaRepository<Question, Integer>{
	Optional<List<Question>> findByExam(Exam exam);
	
}
