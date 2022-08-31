package com.csm.Controller;

import com.csm.Model.College;
import com.csm.Model.CollegeDepartment;
import com.csm.Model.Department;
import com.csm.Model.Student;
import com.csm.Service.CollegeDepartmentService;
import com.csm.Service.CollegeService;
import com.csm.Service.DepartmentService;
import com.csm.Service.StudentRegistrationService;
import org.apache.catalina.LifecycleState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.Multipart;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StudentRegistrationController {

	@Autowired
	private CollegeService collegeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private CollegeDepartmentService collegeDepartmentService;
	@Autowired
	private StudentRegistrationService studentRegistrationService;

	@GetMapping("/studentRegistration")
	public String studentRegistration(Model model) {
		System.out.println("Inside Student Registration Method------------->>");
		List<College> collegeList = collegeService.getAllCollege();
		collegeList.forEach(System.out::println);
		model.addAttribute("collegeList", collegeList);

		List<Student> studentList = studentRegistrationService.getAllStudent();
		model.addAttribute("studentList", studentList);
		return "studentRegistration";
	}

	@ResponseBody
	@GetMapping(value = "/getDepartment")
	public List<Department> getDepartment(@RequestParam("collegeId") Integer collegeId, Model model) {
		System.out.println("Inside Get Department Method------------->>");
		System.out.println("College Id : " + collegeId);
		List<Department> departmentList = new ArrayList<>();
		College college = collegeService.getCollegeByCollegeId(collegeId);
		System.out.println("College : " + college);
		List<CollegeDepartment> collegeDepartmentList = college.getDepartmentList();
		System.out.println("College Department List : " + collegeDepartmentList);
		collegeDepartmentList.forEach(collegeDepartment -> {
			departmentList.add(collegeDepartment.getDepartment());
		});
		departmentList.forEach(System.out::println);
		return departmentList;
	}

	@PostMapping(value = "/studentRegistration")
	public String studentRegistration(Student student,
	                                  @RequestParam(value = "collegeId", required = false) Integer collegeId,
	                                  @RequestParam(value = "departmentId", required = false) Integer departmentId,
	                                  @RequestParam(value = "documentProof", required = false) MultipartFile document,
	                                  Model model) {
		System.out.println("Inside Student Registration Method------------->>");
		System.out.println("Student Details : " + student);
		System.out.println("College Id : " + collegeId);
		System.out.println("Department Id : " + departmentId);
		System.out.println("Document Proof : " + document);
		College college = collegeService.getCollegeByCollegeId(collegeId);
		student.setCollege(college);
		college.getDepartmentList().forEach(collegeDepartment -> {
			if (collegeDepartment.getDepartment().getDepartmentId() == departmentId) {
				student.setCollegeDepartment(collegeDepartment);
			}
		});
		studentRegistrationService.saveStudent(student);

		List<Student> studentList = studentRegistrationService.getAllStudent();
		model.addAttribute("studentList", studentList);
		return "studentRegistration";
	}

}
