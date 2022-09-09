<%--
  Created by IntelliJ IDEA.
  User: sambit.pradhan
  Date: 9/8/2022
  Time: 12:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Lecturer Registration</title>
</head>
<body style="margin: 2rem;">
<style>
    a{
        cursor: pointer;
    }
</style>
<h3 style="color: green">Lecturer Registration Form</h3>

<div class="card text-center" style="margin-right: 5rem; margin-left: 5rem;">
    <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item"><a class="nav-link active" id="addId" onclick="openAdd()" <%--href="/add"--%>>Add</a></li>
            <li class="nav-item"><a class="nav-link" id="viewId" onclick="openView()" <%--href="/view"--%>>View</a></li>
        </ul>
    </div>

    <div class="card-body">
        <div id="add">
            <form action="/addLecturer" method="post" id="addLecturerForm" autocomplete="off" onsubmit="return validateForm()" enctype="multipart/form-data">
                <h3 class="card-title">Lecturer Details</h3>
                <div class="form">

                    <div class="row g-3 m-4">
                        <div class="col-md-3 control-label">
                            <label for="lecturerName" class="form-label control-label">Lecturer Name</label>
                            <input type="text" name="lecturerName" class="form-control" id="lecturerName" placeholder="Enter Lecturer Name">
                        </div>

                        <div class="col-md-3     control-label">
                            <label for="lecturerUserName" class="form-label control-label">User Name</label>
                            <input type="text" name="lecturerUserName" class="form-control" id="lecturerUserName" placeholder="Enter User Name">
                        </div>

                        <div class="col-md-3 control-label">
                            <label for="lecturerEmail" class="form-label control-label">Email</label>
                            <input type="text" name="lecturerEmail" class="form-control" id="lecturerEmail" placeholder="Enter Email Address">
                        </div>

                        <div class="">
                            <img src="images/default.jpg" id="frame" class="img-fluid" style="position: absolute; left: 80rem; top: 10rem; height: 15rem; width: 14rem;">
                        </div>
                    </div>

                    <div class="row g-3 m-4">
                        <div class="col-md-3 control-label">
                            <label for="lecturerName" class="form-label control-label">Date Of Birth</label>
                            <input type="date" name="lecturerDob" class="form-control" id="lecturerDob" placeholder="Select Date Of Birth">
                        </div>

                        <div class="col-md-3 control-label">
                            <label for="lecturerGender1" class="form-label control-label">Gender</label>
                            <div class="row g-2" style="margin-left: 6rem;">
                                <div class="col-md-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="lecturerGender" id="lecturerGender1" value="Male" checked>
                                        <label class="form-check-label" for="lecturerGender1"> Male </label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="lecturerGender" id="lecturerGender2" value="FeMale">
                                        <label class="form-check-label" for="lecturerGender2">FeMale </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 control-label">
                            <label for="lecturerAddress" class="form-label control-label">Address</label>
                            <textarea name="lecturerAddress" class="form-control" id="lecturerAddress" placeholder="Enter Address" rows="6"></textarea>
                        </div>

                        <div class="col-md-2" style="position: absolute; left: 79rem; top: 25rem;">
                            <label for="image" class="form-label">Upload Your Image:</label>
                            <input class="form-control" type="file" id="Image" onchange="preview()" name="imageData">
                            <small style="color: orangered">(.jpg/.jpeg/.gif only & Max size 500 KB)</small>
                        </div>
                    </div>



                    <div class="row g-3 m-4">
                        <div class="col-md-3 control-label" style="margin-top: -6rem;">
                            <label for="collegeId" class="form-label control-label">Select College</label>
                            <select class="form-control form-control" name="collegeId" id="collegeId" onchange="getDepartment(this.value)">
                                <option value="Select" hidden>Select</option>
                                <c:forEach items="${collegeList}" var="college">
                                    <option value="${college.collegeId}">${college.collegeName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-3     control-label" style="margin-top: -6rem;">
                            <label for="departmentId" class="form-label control-label">Select Department</label>
                            <select class="form-control" name="departmentId" id="departmentId">
                                <option value="Select" hidden>Select</option>
                            </select>
                        </div>
                    </div>

                    <div class="row g-3 m-4">
                        <div class="col-md-3">
                            <label for="lecturerPhone" class="form-label control-label">Phone Number</label>
                            <input type="text" id="lecturerPhone" name="lecturerPhone" class="form-control" placeholder="Enter Phone Number"/>
                        </div>

                        <div class="col-md-3     control-label">
                            <label for="lecturerExperience" class="form-label control-label">Experience</label>
                            <input type="text" name="lecturerExperience" class="form-control" id="lecturerExperience" placeholder="Enter Experience">
                        </div>

                        <div class="col-md-3     control-label">
                            <label for="lecturerPassword" class="form-label control-label">Password</label>
                            <input type="password" name="lecturerPassword" class="form-control" id="lecturerPassword" placeholder="Enter Password">
                        </div>

                        <div class="col-md-3     control-label">
                            <label for="lecturerConfirmPassword" class="form-label control-label">Confirm Password</label>
                            <input type="password" name="lecturerConfirmPassword" class="form-control" id="lecturerConfirmPassword" placeholder="Enter Confirm Password">
                        </div>
                    </div>

                </div>

                <div class="">
                    <div class="btnhold mt-3">
                        <button type="submit" class="btn btn-outline-primary mr-3">Submit</button>
                        <button type="reset" class="btn btn-outline-secondary">Reset</button>
                    </div>
                </div>

            </form>
</div>



        <div id="view">
            <h3 class="card-title">Lecturer Details</h3>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Sl.No</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Date Of Birth</th>
                    <th>Gender</th>
                    <th>Mobile</th>
                    <th>Address</th>
                    <th>College</th>
                    <th>Department</th>
                    <th>Experience</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${lecturerList}" var="lecturer" varStatus="count">
                    <tr>
                        <td>${count.count}</td>
                        <td>${lecturer.lecturerName}</td>
                        <td>${lecturer.lecturerEmail}</td>
                        <td>${lecturer.lecturerDob}</td>
                        <td>${lecturer.lecturerGender}</td>
                        <td>${lecturer.lecturerPhone}</td>
                        <td>${lecturer.lecturerAddress}</td>
                        <td>${lecturer.college.collegeName}</td>
                        <td>${lecturer.workingDepartment.departmentName}</td>
                        <td>${lecturer.lecturerExperience}</td>
                        <td>
                            <a href = "/edit/${lecturer.lecturerId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16"><path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/></svg></a>
                            |
                            <a href = "/delete/${lecturer.lecturerId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <a href="/"><button class="btn btn-primary">Home</button></a>
</div>

</body>

<script>

    $(document).ready(function (){
        $('#add').show();
        $('#view').hide();
    });

    function openAdd(){
        $('#view').hide();
        $('#add').show();

        $('#addId').addClass("active");
        $('#viewId').removeClass("active");
    }
    function openView(){
        $('#view').show();
        $('#add').hide();

        $('#addId').removeClass("active");
        $('#viewId').addClass("active");
    }

    function preview() {
        frame.src = URL.createObjectURL(event.target.files[0]);
    }

    function getDepartment(collegeId){
        console.log(collegeId);
        $.ajax({
            url: '/getDepartment',
            type: 'GET',
            data: {
                collegeId: collegeId
            },
            success: function (result) {
                console.log(result);
                // var s = '';
                var s = '<option value="Select" hidden>Select</option>';
                for(var i = 0; i < result.length; i++) {
                    var id = s += '<option value="' + result[i].departmentId + '">' + result[i].departmentName + '</option>';
                }
                $('#departmentId').html(s);
            }
        });
    }

    function validateForm(){
        let name = $('#lecturerName').val();
        let username = $('#lecturerUserName').val();
        let dob = $('#lecturerDob').val();
        let address = $('#lecturerAddress').val();
        let experience = $('#lecturerExperience').val();
        let email = $('#lecturerEmail').val();
        let phone = $('#lecturerPhone').val();
        let collegeId = $('#collegeId').val();
        let departmentId = $('#departmentId').val();
        let password = $('#lecturerPassword').val();
        let confirmPassword = $('#lecturerConfirmPassword').val();
        let gender = $('#gender').val();

        let nameRegex = /^[a-zA-Z ]{2,30}$/;
        let usernameRegex = /^[a-zA-Z0-9]{2,30}$/;
        let addressRegex = /^[#.0-9a-zA-Z\s,-]{2,30}$/;
        let experienceRegex = /^[0-9]{1,2}$/;
        let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        let phoneRegex = /^[0-9]{10}$/;
        let passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$/;

        if (name == null || name === "") {
            alert("Name must be filled out");
            return false;
        } else if (!nameRegex.test(name)) {
            alert("Invalid Name, Name must be between 2 to 30 characters");
            return false;
        } else if (username == null || username === ""){
            alert("Username must be filled out");
            return false;
        }else if(!username.match(usernameRegex)){
            alert("Invalid Username, Username must be between 2 to 30 characters");
            return false;
        }else if(email == null || email === "") {
            alert("Email must be filled out");
            return false;
        }else if(!email.match(emailRegex)) {
            alert("Invalid Email");
            return false;
        }else if (dob == null || dob === "") {
            alert("Date of Birth must be filled out");
            return false;
        }else if(new Date(dob) >= new Date()) {
            alert("Date of birth must be less than current date");
            return false;
        }else if (address == null || address === "") {
            alert("Address must be filled out");
            return false;
        }else if(!address.match(addressRegex)) {
            alert("Invalid Address, Address must be between 2 to 30 characters");
            return false;
        }else if(collegeId == null || collegeId === "Select") {
            alert("College must be selected");
            return false;
        }else if(departmentId == null || departmentId === "Select") {
            alert("Department must be selected");
            return false;
        }else if(phone == null || phone === "") {
            alert("Phone must be filled out");
            return false;
        }else if(!phone.match(phoneRegex)) {
            alert("Invalid Phone, Phone must be 10 digits");
            return false;
        }else if (experience == null || experience === "") {
            alert("Experience must be filled out");
            return false;
        }else if(!experience.match(experienceRegex)) {
            alert("Invalid Experience, Experience must be between 1 to 2 digits");
            return false;
        }else if (password == null || password === "") {
            alert("Password must be filled out");
            return false;
        }else if(!password.match(passwordRegex)) {
            alert("Invalid Password, Password must be between 2 to 30 characters");
            return false;
        }else if (confirmPassword == null || confirmPassword === "") {
            alert("Confirm Password must be filled out");
            return false;
        }else if(!confirmPassword.match(passwordRegex)) {
            alert("Invalid Confirm Password, Confirm Password must be between 2 to 30 characters");
            return false;
        }else if(password !== confirmPassword) {
            alert("Password and Confirm Password must be same");
            return false;
        }else {
            alert("Validation Successfully🥳🥳")
            return true;
        }
    }
</script>
</html>







