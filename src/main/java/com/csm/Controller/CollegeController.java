package com.csm.Controller;

import com.csm.Model.College;
import com.csm.Model.CollegeDepartment;
import com.csm.Model.Department;
import com.csm.Service.CollegeDepartmentService;
import com.csm.Service.CollegeService;
import com.csm.Service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.PreDestroy;
import java.util.List;

@Controller
public class CollegeController {

	@Autowired
	private CollegeService collegeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private CollegeDepartmentService collegeDepartmentService;

	@GetMapping(value = "/addCollege")
	public String addCollege(Model model) {
		System.out.println("Inside Add College Method------------->>");
		List<College> collegeList = collegeService.getAllCollege();
		List<Department> departmentList = departmentService.getAllDepartment();
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("departmentList", departmentList);
		return "addCollege";
	}

	@PostMapping(value = "/addCollege")
	public String addCollege(College college, Model model){
		System.out.println("Inside Save College Method------------->>");
		System.out.println("College Details : " + college);
		College duplicateCollege = collegeService.getCollegeByCollegeName(college.getCollegeName());
		if (duplicateCollege != null) {
			System.out.println("College Already Exists------------>>");
			model.addAttribute("status", 2);
		}else {
			College savedCollege = collegeService.saveCollege(college);
			if (savedCollege != null && savedCollege.getCollegeId() > 0) {
				System.out.println("College Saved Successfully------------->>");
				model.addAttribute("status", 1);
			} else {
				System.out.println("College Save Failed------------->>");
				model.addAttribute("status", 0);
			}
		}
		return "addCollege";
	}

	@PostMapping(value = "/addCollegeDepartment")
	public String addCollegeDepartment(@RequestParam(value = "collegeId", required = false)int collegeId,
									   @RequestParam(value = "departmentId", required = false)int departmentId,
									   @RequestParam(value = "courseFee", required = false)Double courseFee,
									   Model model, CollegeDepartment collegeDepartment){
		System.out.println("Inside Save College Department Method------------->>");
		System.out.println("College Id : " + collegeId);
		System.out.println("Department Id : " + departmentId);
		College college = collegeService.getCollegeByCollegeId(collegeId);
		List<CollegeDepartment> departmentList1 = college.getDepartmentList();

		 collegeDepartment.setDepartment(departmentService.getDepartmentByDepartmentId(departmentId));
		 collegeDepartment.setCourseFee(courseFee);
		 collegeDepartment =collegeDepartmentService.saveCollegeDepartment(collegeDepartment);

		departmentList1.add(collegeDepartment);
		college.setDepartmentList(departmentList1);
		collegeService.saveCollege(college);

		List<College> collegeList = collegeService.getAllCollege();
		List<Department> departmentList = departmentService.getAllDepartment();
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("departmentList", departmentList);
		return "addCollege";
	}
}
