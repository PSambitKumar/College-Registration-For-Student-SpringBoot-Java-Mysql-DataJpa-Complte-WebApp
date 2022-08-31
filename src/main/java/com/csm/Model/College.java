package com.csm.Model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "tbl_college")
public class College {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int collegeId;
	private String collegeName;
	@OneToMany(targetEntity = CollegeDepartment.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "collegeId", referencedColumnName = "collegeId")
	private List<CollegeDepartment> departmentList;
	private String status;


	public int getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(int collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public List<CollegeDepartment> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<CollegeDepartment> departmentList) {
		this.departmentList = departmentList;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "College{" +
			   "collegeId=" + collegeId +
			   ", collegeName='" + collegeName + '\'' +
			   ", departmentList=" + departmentList +
			   ", status='" + status + '\'' +
			   '}';
	}
}
