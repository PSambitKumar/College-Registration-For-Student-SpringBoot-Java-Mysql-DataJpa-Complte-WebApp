package com.csm.Model;

import javax.persistence.*;

@Entity
@Table
public class CollegeDepartment {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int collegeDepartmentId;
	@ManyToOne
	@JoinColumn(name = "departmentId")
	private Department department;
	private Double courseFee;

	public int getCollegeDepartmentId() {
		return collegeDepartmentId;
	}

	public void setCollegeDepartmentId(int collegeDepartmentId) {
		this.collegeDepartmentId = collegeDepartmentId;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "CollegeDepartment{" +
			   "collegeDepartmentId=" + collegeDepartmentId +
			   ", department=" + department +
			   ", courseFee=" + courseFee +
			   '}';
	}

	public Double getCourseFee() {
		return courseFee;
	}

	public void setCourseFee(Double courseFee) {
		this.courseFee = courseFee;
	}

}
