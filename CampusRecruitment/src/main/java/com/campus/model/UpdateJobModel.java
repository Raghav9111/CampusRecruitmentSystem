package com.campus.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateJobModel
{
	    private String description;
	    private Integer vacancies;
	    private String technologyRequired;
	    private String experience;
	    private String location;
	    private String expectedSalary;

}
