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
@Table(name = "result")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result
{
	   @Id
	   @Column(name="result_id")
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer resultId;

	    @ManyToOne
	    @JoinColumn(name = "jobseeker_id")
	    private JobSeeker jobseeker;

	    @ManyToOne
	    @JoinColumn(name = "exam_id")
	    private Exam exam;
	    @Column
	    private int marks;
		public Result(JobSeeker jobseeker, Exam exam, int marks) {
			super();
			this.jobseeker = jobseeker;
			this.exam = exam;
			this.marks = marks;
		}
	    
	    

}
