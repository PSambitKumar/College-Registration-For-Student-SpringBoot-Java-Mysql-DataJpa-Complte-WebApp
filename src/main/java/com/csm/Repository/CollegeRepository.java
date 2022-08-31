package com.csm.Repository;

import com.csm.Model.College;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CollegeRepository extends JpaRepository<College, Integer> {
	College getCollegeByCollegeId(Integer collegeId);
	void deleteCollegeByCollegeId(Integer collegeId);
	College getCollegeByCollegeName(String collegeName);
}
