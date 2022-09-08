package com.csm.Model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Arrays;

/**
 * @Project : CollegeRegistration
 * @Auther : Sambit Kumar Pradhan
 * @Created On : 08/09/2022 - 12:29 PM
 */
@Entity
@Table(name = "lecturer")
public class Lecturer {
	private static long serialVersionUID = 9947398524523523L;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int lecturerId;
	private String lecturerName;
	private String lecturerUserName;
	private String lecturerEmail;
	private Date lecturerDob;
	private String lecturerGender;
	private String lecturerAddress;
	private String lecturerPhone;
	private String lecturerPassword;
	private String lecturerQualification;
	private int lecturerExperience;
	@ManyToOne
	@JoinColumn(name = "collegeId")
	private  College college;
	@ManyToOne
	@JoinColumn(name = "departmentId")
	private Department workingDepartment;
	@Lob
	private byte[] lecturerImage;
	private String lecturerImageName;
	private String lecturerImageType;
	private Date createdDate;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public static void setSerialVersionUID(long serialVersionUID) {
		Lecturer.serialVersionUID = serialVersionUID;
	}

	public int getLecturerId() {
		return lecturerId;
	}

	public void setLecturerId(int lecturerId) {
		this.lecturerId = lecturerId;
	}

	public String getLecturerName() {
		return lecturerName;
	}

	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}

	public String getLecturerEmail() {
		return lecturerEmail;
	}

	public void setLecturerEmail(String lecturerEmail) {
		this.lecturerEmail = lecturerEmail;
	}

	public Date getLecturerDob() {
		return lecturerDob;
	}

	public void setLecturerDob(Date lecturerDob) {
		this.lecturerDob = lecturerDob;
	}

	public String getLecturerGender() {
		return lecturerGender;
	}

	public void setLecturerGender(String lecturerGender) {
		this.lecturerGender = lecturerGender;
	}

	public String getLecturerAddress() {
		return lecturerAddress;
	}

	public void setLecturerAddress(String lecturerAddress) {
		this.lecturerAddress = lecturerAddress;
	}

	public String getLecturerPhone() {
		return lecturerPhone;
	}

	public void setLecturerPhone(String lecturerPhone) {
		this.lecturerPhone = lecturerPhone;
	}

	public String getLecturerPassword() {
		return lecturerPassword;
	}

	public void setLecturerPassword(String lecturerPassword) {
		this.lecturerPassword = lecturerPassword;
	}

	public String getLecturerQualification() {
		return lecturerQualification;
	}

	public void setLecturerQualification(String lecturerQualification) {
		this.lecturerQualification = lecturerQualification;
	}

	public int getLecturerExperience() {
		return lecturerExperience;
	}

	public void setLecturerExperience(int lecturerExperience) {
		this.lecturerExperience = lecturerExperience;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public Department getWorkingDepartment() {
		return workingDepartment;
	}

	public void setWorkingDepartment(Department workingDepartment) {
		this.workingDepartment = workingDepartment;
	}

	public byte[] getLecturerImage() {
		return lecturerImage;
	}

	public void setLecturerImage(byte[] lecturerImage) {
		this.lecturerImage = lecturerImage;
	}

	public String getLecturerImageName() {
		return lecturerImageName;
	}

	public void setLecturerImageName(String lecturerImageName) {
		this.lecturerImageName = lecturerImageName;
	}

	public String getLecturerImageType() {
		return lecturerImageType;
	}

	public void setLecturerImageType(String lecturerImageType) {
		this.lecturerImageType = lecturerImageType;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "Lecturer{" +
			   "lecturerId=" + lecturerId +
			   ", lecturerName='" + lecturerName + '\'' +
			   ", lecturerUserName='" + lecturerUserName + '\'' +
			   ", lecturerEmail='" + lecturerEmail + '\'' +
			   ", lecturerDob=" + lecturerDob +
			   ", lecturerGender='" + lecturerGender + '\'' +
			   ", lecturerAddress='" + lecturerAddress + '\'' +
			   ", lecturerPhone='" + lecturerPhone + '\'' +
			   ", lecturerPassword='" + lecturerPassword + '\'' +
			   ", lecturerQualification='" + lecturerQualification + '\'' +
			   ", lecturerExperience=" + lecturerExperience +
			   ", college=" + college +
			   ", workingDepartment=" + workingDepartment +
			   ", lecturerImage=" + Arrays.toString(lecturerImage) +
			   ", lecturerImageName='" + lecturerImageName + '\'' +
			   ", lecturerImageType='" + lecturerImageType + '\'' +
			   ", createdDate=" + createdDate +
			   '}';
	}

	public String getLecturerUserName() {
		return lecturerUserName;
	}

	public void setLecturerUserName(String lecturerUserName) {
		this.lecturerUserName = lecturerUserName;
	}

}
