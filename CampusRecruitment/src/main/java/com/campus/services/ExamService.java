package com.campus.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.entities.Company;
import com.campus.entities.Exam;
import com.campus.entities.Job;
import com.campus.model.ExamModel;
import com.campus.repo.ExamRepo;
import com.campus.repo.JobRepo;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class ExamService {
	
	@Autowired
	private JobRepo jobRepo;
	
	@Autowired
	private ExamRepo examRepo;

	public Exam saveExam(ExamModel examModel, Company company) {
		Job job = null;
		job = jobRepo.findById(examModel.getJId()).get();
		if(job!=null) {
			Exam exam = new Exam(job, company, examModel.getDescription(), examModel.getMinimumMarks());
			exam = examRepo.save(exam);
			return exam;
		}
		else {
			System.out.println("Job Null");
			return null;
		}
	}
	
	public ExamModel covertStringToExamModel(String examData) {
		// Parse the string and extract values
		 Pattern pattern = Pattern.compile("(\\w+)=(\\w+(?:\\s+\\w+)*)");
	        Matcher matcher = pattern.matcher(examData);

	        // Initialize variables to hold extracted values
	        String description = null;
	        int minimumMarks = 0;
	        int jId = 0;

	        // Iterate over matches and extract key-value pairs
	        while (matcher.find()) {
	            String key = matcher.group(1);
	            String value = matcher.group(2);
	            // Set values based on keys
	            switch (key) {
	                case "description":
	                    description = value;
	                    break;
	                case "minimumMarks":
	                    minimumMarks = Integer.parseInt(value);
	                    break;
	                case "jId":
	                    jId = Integer.parseInt(value);
	                    break;
	                // Add cases for other fields if needed
	            }
	        }

	        // Create an instance of ExamModel and set the values
	        ExamModel examModel = new ExamModel();
	        examModel.setDescription(description);
	        examModel.setMinimumMarks(minimumMarks);
	        examModel.setJId(jId);
        
        return examModel;
    }

	public Exam getByJob(Job job) {
		return examRepo.findByJob(job).get();
	}

}
