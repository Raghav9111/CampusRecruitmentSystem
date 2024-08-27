package com.campus.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JsRegisterModel {
	private String name;
	private String contact;
	private String address;
	private String resume;
	private String role;
    private String skills;
	private String description;
	private String email;
	private String password;

}
