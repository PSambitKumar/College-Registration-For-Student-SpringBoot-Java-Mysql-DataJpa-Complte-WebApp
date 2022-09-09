package com.csm.ServiceImpl;

import com.csm.Model.Lecturer;
import com.csm.Repository.LecturerRepository;
import com.csm.Service.LecturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Project : CollegeRegistration
 * @Auther : Sambit Kumar Pradhan
 * @Created On : 08/09/2022 - 6:07 PM
 */

@Service
public class LecturerServiceImpl implements LecturerService {

	@Autowired
	private LecturerRepository lecturerRepository;

	@Override
	public List<Lecturer> getAllLecturerList() {
		return lecturerRepository.findAll();
	}
}
