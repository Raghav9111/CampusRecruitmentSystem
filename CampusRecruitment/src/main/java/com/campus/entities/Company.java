package com.campus.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.campus.model.CompanyUpdateModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Table(name = "company")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Company 
{
	@Id
	@Column(name = "company_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer companyId;
	    
	    @Column(name= "cname",nullable = false)
	    private String name;
	    
	    @Column(name="address")
	    private String address;
	    
	    @Column(name="description")
	    private String description;
	    
	    @Column(name = "active_status")
	    private boolean activeStatus;
	    
	    @Column(name = "authenticate_by")
	    private String authenticateBy;
	    
	    @Column
	    private String cin;
	    
	    @Column
	    private String logo;
	    
	    @Column
	    private String certificate;
	    
	    @ManyToOne
	    @JoinColumn(name = "user_id")
	    private User user;

		public Company(String name, String address, String description, boolean activeStatus, 
				String cin, String certificate, User user) {
			super();
			this.name = name;
			this.address = address;
			this.description = description;
			this.activeStatus = activeStatus;
			this.cin = cin;
			this.certificate = certificate;
			this.user = user;
		}

	public void updateCompany(CompanyUpdateModel model)
	{
		if(model.getAddress()!=null) this.address = model.getAddress();
		if(model.getDescription()!=null) this.description=model.getDescription();
	}

}
