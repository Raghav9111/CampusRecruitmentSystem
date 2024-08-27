package com.campus.entities;

import java.text.ParseException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.campus.model.UpdateJobModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Table(name = "job")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Job 
{
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "job_id")
	    private Integer jobId;
	    
	    @Column(nullable = false)
	    private String title;
	    @Column
	    private String description;
	    @Column
	    private Integer vacancies;
	    
	    @Column
	    private String location;
	    
	    @Column
	    private String expected_salary;
	    
	    @Column
	    private String experience;
	    
	    @Column
	    private Boolean exam_status;
	    
	    @Column(name = "technology_required")
	    private String technologyRequired;

	    @ManyToOne
	    @JoinColumn(name = "company_id")
	    private Company company;

	    @Column(name = "active_status")
	    private boolean activeStatus;

		public Job(String title, String description, Integer vacancies, String location, String expected_salary,
				String experience,Boolean exam_status , String technologyRequired, Company company, boolean activeStatus) {
			super();
			this.title = title;
			this.description = description;
			this.vacancies = vacancies;
			this.location = location;
			this.expected_salary = expected_salary;
			this.experience = experience;
			this.exam_status = exam_status;
			this.technologyRequired = technologyRequired;
			this.company = company;
			this.activeStatus = activeStatus;
		}
		
		
		public void updateJob(UpdateJobModel model)  
		{
			if(model.getDescription()!=null) this.description = model.getDescription();
			if(model.getExpectedSalary()!=null) this.expected_salary = model.getExpectedSalary();
			if(model.getExperience()!=null) this.experience = model.getExperience();
			if(model.getLocation()!=null) this.location = model.getLocation();
			if(model.getTechnologyRequired()!=null) this.technologyRequired = model.getTechnologyRequired();
			if(model.getVacancies()!=null) this.vacancies = model.getVacancies();
		}
}
