package com.csm.Repository;

import com.csm.Model.Lecturer;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Project : CollegeRegistration
 * @Auther : Sambit Kumar Pradhan
 * @Created On : 08/09/2022 - 12:53 PM
 */
public interface LecturerRepository extends JpaRepository<Lecturer, Integer> {
}
