package com.csm.ServiceImpl;

import com.csm.Model.Student;
import com.csm.Repository.StudentRepository;
import com.csm.Service.StudentRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class StudentRegistrationServiceImpl implements StudentRegistrationService {

	@Autowired
	private StudentRepository studentRepository;

	@Override
	public List<Student> getAllStudent() {
		return studentRepository.findAll();
	}

	@Override
	public Student getStudentByStudentId(Integer studentId) {
		return null;
	}

	@Override
	public Student saveStudent(Student student) {
		return null;
	}

	@Override
	public void deleteStudentByStudentId(Integer studentId) {
	}

	@Override
	public Student getStudentByStudentName(String studentName) {
		return null;
	}
}
