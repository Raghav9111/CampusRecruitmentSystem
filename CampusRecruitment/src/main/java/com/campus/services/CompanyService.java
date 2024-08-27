package com.campus.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.entities.Company;
import com.campus.entities.JobSeeker;
import com.campus.entities.User;
import com.campus.model.CompanyRegisterModel;
import com.campus.repo.CompanyRepo;

@Service
public class CompanyService {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CompanyRepo cmpRepo;
	
	public String saveCompany(CompanyRegisterModel model) {
		try
		{
			User user = userService.saveUser(model.getEmail(),model.getPassword(),"ROLE_COMPANY");
			
		    if(user!=null)
		    {
		    	Company company = new Company(model.getName(), model.getAddress(), model.getDescription(), true, model.getCin(), model.getCertificate(), user);
		    	cmpRepo.save(company);
		    	return "success";
		    }
		    else
		    {
		    	System.out.println("User is null");
		    	return "failed";
		    }
		}
		catch (Exception e)
		{
			return "failed";
		}
		
	}

	public Company getByUser(User user) {
		return cmpRepo.findByUser(user).get();
	}

	public void updateCompany(Company company) {
		cmpRepo.save(company);
		
	}

	public List<Company> getAllCompanies() {
		return cmpRepo.findAll();
	}

	public Company getByID(Integer cid) {
		return cmpRepo.findById(cid).get();
	}

}
