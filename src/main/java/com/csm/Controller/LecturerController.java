package com.csm.Controller;

import com.csm.Model.College;
import com.csm.Service.CollegeDepartmentService;
import com.csm.Service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @Project : CollegeRegistration
 * @Auther : Sambit Kumar Pradhan
 * @Created On : 08/09/2022 - 12:41 PM
 */

@Controller
public class LecturerController {

	@Autowired
	private CollegeService collegeService;

	@GetMapping(value = "/addLecturer")
	private String addLecturer(Model model) {
		System.out.println("Inside Add Lecturer Method--------->>");
		List<College> collegeList = collegeService.getAllCollege();
		model.addAttribute("collegeList", collegeList);
		return "addLecturer";
	}
}
