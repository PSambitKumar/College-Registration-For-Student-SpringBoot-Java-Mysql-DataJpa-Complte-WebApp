package com.csm.Controller;

import com.csm.Model.College;
import com.csm.Model.CollegeDepartment;
import com.csm.Model.Department;
import com.csm.Model.Lecturer;
import com.csm.Repository.LecturerRepository;
import com.csm.Service.CollegeService;
import com.csm.Service.LecturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Date;
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
	@Autowired
	private LecturerService lecturerService;
	@Autowired
	private LecturerRepository lecturerRepository;

	@GetMapping(value = "/addLecturer")
	private String addLecturer(Model model) {
		System.out.println("Inside Add Lecturer Method--------->>");
		List<Lecturer> lecturerList = lecturerService.getAllLecturerList();
		List<College> collegeList = collegeService.getAllCollege();
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("lecturerList", lecturerList);
		return "addLecturer";
	}

	@PostMapping(value = "/addLecturer")
	public String addLecturer(@RequestParam(value = "collegeId", required = false)int collegeId,
	                          @RequestParam(value = "departmentId", required = false)int departmentId,
	                          @RequestParam(value = "imageData", required = false) MultipartFile lecturerProfileImage,
	                          Lecturer lecturer) {
		System.out.println("Inside Save Lecturer Method--------->>");
		System.out.println("Lecturer Details : " + lecturer);
		System.out.println("College Id : " + collegeId + ", Department Id : " + departmentId + ", Lecturer Profile Image : " + lecturerProfileImage);
		Department department = null;
		try {
			College college = collegeService.getCollegeByCollegeId(collegeId);
			for (CollegeDepartment collegeDepartment : college.getDepartmentList()) {
				if (collegeDepartment.getDepartment().getDepartmentId() == departmentId) {
					System.out.println("Found Department : " + collegeDepartment.getDepartment());
					department = collegeDepartment.getDepartment();
					break;
				}
			}

			System.out.println("College Details : " + college);
			System.out.println("Department Details : " + department);

			lecturer.setLecturerImage(lecturerProfileImage.getBytes());
			lecturer.setLecturerImageName(lecturerProfileImage.getOriginalFilename());
			lecturer.setLecturerImageType(lecturerProfileImage.getContentType());
			lecturer.setCreatedDate(new Date(System.currentTimeMillis()));
			lecturer.setCollege(college);
			lecturer.setWorkingDepartment(department);

			System.out.println("Final Lecturer Details : " + lecturer);

			lecturer = lecturerRepository.save(lecturer);
			System.out.println("Lecturer Saved Successfully : " + lecturer);

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return "redirect:/addLecturer";
	}


}
