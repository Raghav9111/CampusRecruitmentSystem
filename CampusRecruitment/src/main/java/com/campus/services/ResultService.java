package com.campus.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.entities.Candidates;
import com.campus.entities.Company;
import com.campus.entities.Exam;
import com.campus.entities.Job;
import com.campus.entities.JobSeeker;
import com.campus.entities.Question;
import com.campus.entities.Result;
import com.campus.model.SaveAnswerModel;
import com.campus.model.SaveResultModel;
import com.campus.repo.CandidateRepo;
import com.campus.repo.QuestionRepo;
import com.campus.repo.ResultRepo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;

@Service
public class ResultService {
	
	@Autowired
	private QuestionRepo qusRepo;
	
	@Autowired
	private ResultRepo resultRepo;
	
	@Autowired
	private CandidateRepo candidateRepo;

	public Boolean checkAndSaveResult(SaveResultModel resModel, Job job, Exam exam, JobSeeker jobSeeker) {

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			int marks = 0;
			List<SaveAnswerModel> answerModel = objectMapper.readValue(resModel.getResData(), new TypeReference<List<SaveAnswerModel>>() {});
			
			List<Question> correctAnsList = null; 
			correctAnsList = qusRepo.findByExam(exam).get();
			System.err.println(resModel);
			System.err.println("Correct Ans"+correctAnsList);
			System.err.println("Attempt"+answerModel);
			for(int i=0; i<answerModel.size(); i++) {
				if(correctAnsList.get(i).getCorrectAnswer().equals(answerModel.get(i).getAns())) {
					marks++;
				}
			}
			Result result = new Result(jobSeeker, exam, marks);
			result = resultRepo.save(result);
			if(result != null) {
				if(result.getMarks()>= exam.getMinimumMarks()) {
					Candidates candidates = new Candidates(jobSeeker, job.getCompany(), job, false);
					candidateRepo.save(candidates);
					return true;
				}
				return false;
			}
			return false;
		}catch (Exception e) {
			System.err.println("Data not saved"+e.getMessage());
			return false;
		}
	}

	public List<Result> findByJobseeker(JobSeeker jobseeker) {
		Optional<List<Result>> list = resultRepo.findByJobseeker(jobseeker);
		if(list.isPresent())
		{
			return list.get();
		}
		else
		{
			return null;
		}
		
	}

}
