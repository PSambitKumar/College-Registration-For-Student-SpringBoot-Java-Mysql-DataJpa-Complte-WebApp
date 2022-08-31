package com.csm.Service;

import com.csm.Model.CollegeDepartment;

import java.util.List;

public interface CollegeDepartmentService {
	CollegeDepartment saveCollegeDepartment(CollegeDepartment collegeDepartment);
	List<CollegeDepartment> getAllCollegeDepartment();
}
