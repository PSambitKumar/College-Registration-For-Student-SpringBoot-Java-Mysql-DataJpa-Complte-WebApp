package com.csm.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentRegistrationController {

	@GetMapping("/studentRegistration")
	public String studentRegistration() {
		System.out.println("Inside Student Registration Method------------->>");
		return "studentRegistration";
	}
}
