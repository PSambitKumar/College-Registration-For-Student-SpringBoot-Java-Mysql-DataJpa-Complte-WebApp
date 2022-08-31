package com.csm.Model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "tbl_student")
public class Student {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int studentId;
	private String studentName;
	private Date studentDob;
	private String studentAddress;
	private String studentMobile;
	private String studentEmail;
	private String studentGender;
	private String documentPath;
	@ManyToOne
	@JoinColumn(name = "departmentId")
	private CollegeDepartment collegeDepartment;
	@ManyToOne
	@JoinColumn(name = "collegeId")
	private College college;


	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public Date getStudentDob() {
		return studentDob;
	}

	public void setStudentDob(Date studentDob) {
		this.studentDob = studentDob;
	}

	public String getStudentAddress() {
		return studentAddress;
	}

	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}

	public String getStudentMobile() {
		return studentMobile;
	}

	public void setStudentMobile(String studentMobile) {
		this.studentMobile = studentMobile;
	}

	public String getStudentEmail() {
		return studentEmail;
	}

	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}

	public String getStudentGender() {
		return studentGender;
	}

	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}

	public String getDocumentPath() {
		return documentPath;
	}

	public void setDocumentPath(String documentPath) {
		this.documentPath = documentPath;
	}

	public CollegeDepartment getCollegeDepartment() {
		return collegeDepartment;
	}

	public void setCollegeDepartment(CollegeDepartment collegeDepartment) {
		this.collegeDepartment = collegeDepartment;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	@Override
	public String toString() {
		return "Student{" +
			   "studentId=" + studentId +
			   ", studentName='" + studentName + '\'' +
			   ", studentDob=" + studentDob +
			   ", studentAddress='" + studentAddress + '\'' +
			   ", studentMobile='" + studentMobile + '\'' +
			   ", studentEmail='" + studentEmail + '\'' +
			   ", studentGender='" + studentGender + '\'' +
			   ", documentPath='" + documentPath + '\'' +
			   ", collegeDepartment=" + collegeDepartment +
			   ", college=" + college +
			   '}';
	}
}
