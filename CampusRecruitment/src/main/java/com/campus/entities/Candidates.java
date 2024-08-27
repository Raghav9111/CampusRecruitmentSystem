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
@Table(name = "candidates")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Candidates
{
	  @Id
	  @Column(name="sc_id")
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer scId;

	    @ManyToOne
	    @JoinColumn(name = "jobseeker_id")
	    private JobSeeker jobseeker;

	    @ManyToOne
	    @JoinColumn(name = "company_id")
	    private Company company;
	    
	    @ManyToOne
	    @JoinColumn(name = "job_id")
	    private Job job;
	    
	    @Column
	    private Boolean status;

		public Candidates(JobSeeker jobseeker, Company company, Job job, Boolean status) {
			super();
			this.jobseeker = jobseeker;
			this.company = company;
			this.job = job;
			this.status = status;
		}

}
