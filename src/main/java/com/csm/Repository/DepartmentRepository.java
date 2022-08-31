package com.csm.Repository;

import com.csm.Model.Department;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {
	Department getDepartmentByDepartmentId(Integer departmentId);
	void deleteDepartmentByDepartmentId(Integer departmentId);
	Department getDepartmentByDepartmentName(String departmentName);
}
