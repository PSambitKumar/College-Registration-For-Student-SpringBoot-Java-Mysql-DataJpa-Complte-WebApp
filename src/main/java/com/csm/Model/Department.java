package com.csm.Model;

import javax.persistence.*;

@Entity
@Table(name = "tbl_department")
public class Department {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int departmentId;
	private String departmentName;
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	@Override
	public String toString() {
		return "Department{" +
			   "departmentId=" + departmentId +
			   ", departmentName='" + departmentName + '\'' +
			   ", status='" + status + '\'' +
			   '}';
	}
}
