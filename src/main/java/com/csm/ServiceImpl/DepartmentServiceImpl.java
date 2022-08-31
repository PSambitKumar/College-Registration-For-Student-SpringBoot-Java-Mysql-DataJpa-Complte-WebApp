package com.csm.ServiceImpl;

import com.csm.Model.Department;
import com.csm.Repository.DepartmentRepository;
import com.csm.Service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentRepository departmentRepository;

	@Override
	public List<Department> getAllDepartment() {
		return departmentRepository.findAll();
	}

	@Override
	public Department getDepartmentByDepartmentId(Integer departmentId) {
		return departmentRepository.getDepartmentByDepartmentId(departmentId);
	}

	@Override
	public Department saveDepartment(Department department) {
		return departmentRepository.save(department);
	}

	@Override
	public void deleteDepartmentByDepartmentId(Integer departmentId) {

	}

	@Override
	public Department getDepartmentByDepartmentName(String departmentName) {
		return departmentRepository.getDepartmentByDepartmentName(departmentName);
	}
}
