package com.csm.Service;

import com.csm.Model.Student;

import java.util.List;

public interface StudentRegistrationService {

	public List<Student> getAllStudent();
	public Student getStudentByStudentId(Integer studentId);
	public Student saveStudent(Student student);
	public void deleteStudentByStudentId(Integer studentId);
	public Student getStudentByStudentName(String studentName);
}
