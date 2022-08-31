package com.csm.Service;

import com.csm.Model.Department;

import java.util.List;

public interface DepartmentService {
	List<Department> getAllDepartment();
	Department getDepartmentByDepartmentId(Integer departmentId);
	Department saveDepartment(Department department);
	void deleteDepartmentByDepartmentId(Integer departmentId);
	Department getDepartmentByDepartmentName(String departmentName);
}
