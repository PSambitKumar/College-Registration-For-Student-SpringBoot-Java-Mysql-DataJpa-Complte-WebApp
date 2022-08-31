package com.csm.ServiceImpl;

import com.csm.Model.Student;
import com.csm.Repository.StudentRepository;
import com.csm.Service.StudentRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
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
		return studentRepository.save(student);
	}

	@Override
	public void deleteStudentByStudentId(Integer studentId) {
	}

	@Override
	public Student getStudentByStudentName(String studentName) {
		return null;
	}
}
