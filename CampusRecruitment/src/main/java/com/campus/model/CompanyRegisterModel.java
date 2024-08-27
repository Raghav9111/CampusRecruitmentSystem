package com.campus.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyRegisterModel 
{
	private String name;
	private String email;
	private String password;
	private String address;
	private String description;
	private String cin;
	private String certificate;

}
