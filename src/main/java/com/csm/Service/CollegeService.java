package com.csm.Service;

import com.csm.Model.College;

import java.util.List;

public interface CollegeService {
	List<College> getAllCollege();
	College getCollegeByCollegeId(Integer collegeId);
	College saveCollege(College college);
	void deleteCollegeByCollegeId(Integer collegeId);
	College getCollegeByCollegeName(String collegeName);
}
