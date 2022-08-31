package com.csm.Controller;

import com.csm.Model.College;
import com.csm.Model.CollegeDepartment;
import com.csm.Model.Department;
import com.csm.Service.CollegeDepartmentService;
import com.csm.Service.CollegeService;
import com.csm.Service.DepartmentService;
import org.apache.catalina.LifecycleState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@GetMapping("/studentRegistration")
	public String studentRegistration(Model model) {
		System.out.println("Inside Student Registration Method------------->>");
		List<College> collegeList = collegeService.getAllCollege();
		collegeList.forEach(System.out::println);
		model.addAttribute("collegeList", collegeList);
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
}
