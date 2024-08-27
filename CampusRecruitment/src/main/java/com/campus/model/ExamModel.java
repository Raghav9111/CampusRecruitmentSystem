package com.campus.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExamModel {
	private String description;
	private Integer minimumMarks;
	private Integer jId;
}
