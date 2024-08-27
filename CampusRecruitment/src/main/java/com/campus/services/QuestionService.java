package com.campus.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.entities.Exam;
import com.campus.entities.Question;
import com.campus.model.QuestionModel;
import com.campus.model.QuestionSaveModel;
import com.campus.repo.QuestionRepo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;


@Service
public class QuestionService {

	@Autowired
	private QuestionRepo questionRepo;
	
	public Boolean saveQuestion(Exam exam, QuestionModel questionModel) {
		ObjectMapper objectMapper = new ObjectMapper();
		
		try {
			List<QuestionSaveModel> qSaveModelList = objectMapper.readValue(questionModel.getQuestionData(), new TypeReference<List<QuestionSaveModel>>() {});
			for (QuestionSaveModel qus : qSaveModelList) {
				Question question = new Question(qus.getQuestion(), qus.getOption1(), qus.getOption2(), qus.getOption3(), qus.getOption4(), qus.getCorrectAnswer(), exam);
				questionRepo.save(question);						
            }
			return true;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	public List<Question> getQuestionByExam(Exam exam) {
		
		return questionRepo.findByExam(exam).get();
	}

}
