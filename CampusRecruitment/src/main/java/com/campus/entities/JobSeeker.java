package com.campus.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.campus.model.JsUpdateModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Table(name = "jobseeker")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class JobSeeker
{
	   @Id
	   @Column(name="jobSeeker_id")
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer jobSeekerId;
	    
	    @Column(nullable = false)
	    private String name;
	    @Column
	    private String contact;
	    @Column
	    private String address;
	    
	    @Column(nullable = false)
	    private String resume;
	    
	    @Column
	    private String role;
	    @Column
	    private String skills;
	    @Column
	    private String description;

	    @ManyToOne
	    @JoinColumn(name = "user_id")
	    private User user;

		public JobSeeker(String name, String contact, String address, String resume, String role, String skills,
				String description, User user) {
			super();
			this.name = name;
			this.contact = contact;
			this.address = address;
			this.resume = resume;
			this.role = role;
			this.skills = skills;
			this.description = description;
			this.user = user;
		}

		public void updateJobseeker(JsUpdateModel model) {
			if(model.getAddress()!=null) this.address=model.getAddress();
			if(model.getContact()!=null) this.contact=model.getContact();
			if(model.getResume()!=null) this.resume=model.getResume();
			if(model.getRole()!=null) this.role=model.getRole();
			if(model.getSkills()!=null) this.skills = model.getSkills();
			if(model.getDescription()!=null) this.description=model.getDescription();
			}


}
