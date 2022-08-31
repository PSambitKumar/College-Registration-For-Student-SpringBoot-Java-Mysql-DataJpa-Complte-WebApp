package com.csm.ServiceImpl;

import com.csm.Model.CollegeDepartment;
import com.csm.Repository.CollegeDepartmentRepository;
import com.csm.Service.CollegeDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.SecondaryTable;

@Service
public class CollegeDepartmentServiceImpl implements CollegeDepartmentService {
	@Autowired
	private CollegeDepartmentRepository collegeDepartmentRepository;

	@Override
	public CollegeDepartment saveCollegeDepartment(CollegeDepartment collegeDepartment) {
		return collegeDepartmentRepository.save(collegeDepartment);
	}
}
