package com.csm.Controller;

import com.csm.Model.Department;
import com.csm.Service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;

	@GetMapping(value = "/addDepartment")
	public String addDepartment(Model model) {
		System.out.println("Inside Add Department Method------------->>");
		model.addAttribute("departmentList", departmentService.getAllDepartment());
		return "addDepartment";
	}

	@PostMapping(value = "/addDepartment")
	public String addDepartment(Department department, Model model) {
		System.out.println("Inside Save Department Method------------->>");
		System.out.println("Department Details : " + department);
		Department duplicateDepartment = departmentService.getDepartmentByDepartmentName(department.getDepartmentName());
		if (duplicateDepartment != null){
			System.out.println("Department Already Exists------------>>");
			model.addAttribute("status", 2);
			return "addDepartment";
		}else {
			Department savedDepartment = departmentService.saveDepartment(department);
			if (savedDepartment != null && savedDepartment.getDepartmentId() > 0){
				System.out.println("Department Saved Successfully------------->>");
				model.addAttribute("status", 1);
			} else{
				System.out.println("Department Save Failed------------->>");
				model.addAttribute("status", 0);
			}
		}
		model.addAttribute("departmentList", departmentService.getAllDepartment());
		return "addDepartment";
	}
}
