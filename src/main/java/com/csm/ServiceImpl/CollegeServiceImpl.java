package com.csm.ServiceImpl;

import com.csm.Model.College;
import com.csm.Repository.CollegeRepository;
import com.csm.Service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeServiceImpl implements CollegeService {

	@Autowired
	private CollegeRepository collegeRepository;

	@Override
	public List<College> getAllCollege() {
		return collegeRepository.findAll();
	}

	@Override
	public College getCollegeByCollegeId(Integer collegeId) {
		return collegeRepository.getCollegeByCollegeId(collegeId);
	}
	@Override
	public College saveCollege(College college) {
		return collegeRepository.saveAndFlush(college);
	}
	@Override
	public void deleteCollegeByCollegeId(Integer collegeId) {
	}
	@Override
	public College getCollegeByCollegeName(String collegeName) {
		return collegeRepository.getCollegeByCollegeName(collegeName);
	}
}
