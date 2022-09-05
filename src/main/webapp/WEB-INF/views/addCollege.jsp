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
    <title>Department Registration</title>
</head>
<body style="margin: 2rem;">
<style>
    a{
        cursor: pointer;
    }
</style>
<h3 style="color: green">Add College</h3>

<c:choose>
    <c:when test = "${status == 0}">
        <script>
            Swal.fire({
                title: 'Error!',
                text: 'College Registration Failed!.',
                icon: 'error',
                confirmButtonText: 'OK'
            })
        </script>
    </c:when>

    <c:when test = "${status == 1}">
        <script>
            Swal.fire({
                title: 'Success!',
                text: 'College Registered Successfully.',
                icon: 'success',
                confirmButtonText: 'OK'
            })
        </script>
    </c:when>

    <c:when test = "${status == 2}">
        <script>
            Swal.fire({
                title: 'Error!',
                text: 'College Already Exists!.',
                icon: 'error',
                confirmButtonText: 'OK'
            })
        </script>
    </c:when>

<%--    <c:otherwise>--%>
<%--        <script>--%>
<%--            Swal.fire({--%>
<%--                title: 'Error!',--%>
<%--                text: 'Something Went Wrong!.',--%>
<%--                icon: 'error',--%>
<%--                confirmButtonText: 'OK'--%>
<%--            })--%>
<%--        </script>--%>
<%--    </c:otherwise>--%>
</c:choose>

<div class="card text-center" style="margin-right: 5rem; margin-left: 5rem;">
    <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item"><a class="nav-link active" id="addCollege1" onclick="addCollege()" <%--href="/add"--%>>Add College</a></li>
            <li class="nav-item"><a class="nav-link" id="addDepartment1" onclick="addDepartment()" <%--href="/view"--%>>Add Department</a></li>
            <li class="nav-item"><a class="nav-link" id="viewCollege1" onclick="viewCollege()" <%--href="/view"--%>>View College</a></li>
        </ul>
    </div>

    <div class="card-body">
        <div id="addCollege">
            <form action="/addCollege" method="post" id="addCollegeForm">
                <h3 class="card-title">College Name</h3>
                <div class="form">
                    <div class="row g-3 m-4">

                        <div class="col-md-2 control-label">
                        </div>

                        <div class="col-md-4 control-label">
                            <label for="collegeName" class="form-label control-label">College Name</label>
                            <input type="text" name="collegeName" class="form-control" id="collegeName" placeholder="Enter College Name">
                        </div>

                        <div class="col-md-4 control-label">
                            <label for="status" class="form-label control-label">Status</label>
                            <select name="status" id="status" class="form-control">
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>

                        <div class="btnhold mt-3">
                            <button type="button" class="btn btn-outline-primary mr-3" onclick="validateForm()">Submit</button>
                            <button type="reset" class="btn btn-outline-secondary">Reset</button>
                        </div>

                    </div>
                </div>
            </form>
        </div>


        <div class="card-body">
            <div id="addDepartment">
                <form action="/addCollegeDepartment" method="post" id="addCollegeDepartmentForm">
                    <h3 class="card-title">College Name</h3>
                    <div class="form">
                        <div class="row g-3 m-4">

                            <div class="col-md-4 control-label">
                                <label for="collegeId" class="form-label control-label">Select College</label>
                                <select name="collegeId" id="collegeId" class="form-control">
                                    <option hidden value="Select">Select College</option>
                                        <c:forEach var="college" items="${collegeList}">
                                            <option value="${college.collegeId}">${college.collegeName}</option>
                                        </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-4 control-label">
                                <label for="departmentId" class="form-label control-label">Select Department</label>
                                <select name="departmentId" id="departmentId" class="form-control">
                                    <option hidden value="Select">Select Department</option>
                                        <c:forEach var="department" items="${departmentList}">
                                            <option value="${department.departmentId}">${department.departmentName}</option>
                                        </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-4 control-label">
                                <label for="departmentId" class="form-label control-label">Course Fee</label>
                                <input type="number" name="courseFee" id="courseFee" class="form-control">
                            </div>

                            <div class="btnhold mt-3">
                                <button type="submit" class="btn btn-outline-primary mr-3" >Submit</button>
                                <button type="reset" class="btn btn-outline-secondary">Reset</button>
                            </div>

                        </div>
                    </div>
                </form>
            </div>



        <div id="viewCollege">
            <h3 class="card-title">College Details</h3>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Sl.No</th>
                    <th>College Name</th>
                    <th>Department</th>
                    <th>Staus</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${collegeList}" var="college" varStatus="count">
                    <tr>
                        <td>${count.count}</td>
                        <td>${college.collegeName}</td>
                        <td>
                            <c:choose>
                                <c:when test = "${college.departmentList.size() > 0}">
                                    <c:forEach items="${college.departmentList}" var="department" varStatus="count">
                                        <span>${count.count}</span> . ${department.department.departmentName}
                                        <c:if test="${department.courseFee ne null}">(${department.courseFee})</c:if>
                                        <c:if test="${department.courseFee eq null}">(Not Provided)</c:if>
                                        <a href = "/deleteCollegeDepartment/${department.collegeDepartmentId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></a>
                                        , <br>
<%--                                        <span>${department.department.departmentName}, </span>--%>
                                    </c:forEach>
                                </c:when>

                                <c:when test = "${college.departmentList.size() == 0}">
                                    <span>No Department Found!</span>
                                </c:when>
                            </c:choose>
                        </td>
                        <td>${college.status}</td>
                        <td>
                            <a href = "/edit/${college.collegeId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16"><path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/></svg></a>
                            |
                            <a href = "/deleteCollege/${college.collegeId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></a>
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
        $('#addCollege').show();
        $('#addDepartment').hide();
        $('#viewCollege').hide();
    });

    function addCollege(){
        $('#addCollege').show();
        $('#addDepartment').hide();
        $('#viewCollege').hide();

        $('#addCollege1').addClass("active");
        $('#addDepartment2').removeClass("active");
        $('#viewCollege1').removeClass("active");
    }
    function addDepartment(){
        $('#addDepartment').show();
        $('#addCollege').hide();
        $('#viewCollege').hide();

        $('#addDepartment1').addClass("active");
        $('#addCollege1').removeClass("active");
        $('#viewCollege1').removeClass("active");
    }

    function viewCollege(){
        $('#addDepartment').hide();
        $('#addCollege').hide();
        $('#viewCollege').show();


        $('#viewCollege1').addClass("active");
        $('#addCollege1').removeClass("active");
        $('#addDepartment1').removeClass("active");
    }

    function validateForm(){
        var collegeName = $('#collegeName').val();
        var status = $('#status').val();
        if(collegeName == ''){
            alert('Please Enter College Name');
            return false;
        }
        if(status == ''){
            alert('Please Select Status');
            return false;
        }
        $('#addCollegeForm').submit();
    }

</script>
</html>
