package com.campus.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Table(name = "exam")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Exam 
{
	@Id
	@Column(name="exam_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer examId;
    
    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job;
    
    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @Column
    private String description;
    
    @Column(name = "minimum_marks")
    private int minimumMarks;

	public Exam(Job job, Company company, String description, int minimumMarks) {
		this.job = job;
		this.company = company;
		this.description = description;
		this.minimumMarks = minimumMarks;
	}
    
    

}
