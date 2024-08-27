package com.campus.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JsUpdateModel {
	private String contact;
	private String address;
	private String resume;
	private String role;
    private String skills;
	private String description;
}
