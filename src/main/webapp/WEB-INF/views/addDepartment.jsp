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
<h3 style="color: green">Department Registration Form</h3>

<%--Working--%>
<%--<c:if test="${status eq 1}">--%>
<%--    <div class="alert alert-success">--%>
<%--        <strong>Success!</strong> Department Registered Successfully.--%>
<%--    </div>--%>
<%--</c:if>--%>


<%--Working--%>
<%--<c:if test="${status eq 1}">--%>
<%--  <script>--%>
<%--    Swal.fire({--%>
<%--      title: 'Success!',--%>
<%--      text: 'Department Registered Successfully.',--%>
<%--      icon: 'success',--%>
<%--      confirmButtonText: 'OK'--%>
<%--    })--%>
<%--  </script>--%>
<%--</c:if>--%>


<%--Working--%>
<c:choose>
  <c:when test = "${status == 0}">
    <script>
        Swal.fire({
            title: 'Error!',
            text: 'Department Registration Failed!.',
            icon: 'error',
            confirmButtonText: 'OK'
        })
    </script>
  </c:when>

  <c:when test = "${status == 1}">
    <script>
        Swal.fire({
            title: 'Success!',
            text: 'Department Registered Successfully.',
            icon: 'success',
            confirmButtonText: 'OK'
        })
    </script>
  </c:when>

  <c:when test = "${status == 2}">
    <script>
        Swal.fire({
            title: 'Error!',
            text: 'Department Already Exists!.',
            icon: 'error',
            confirmButtonText: 'OK'
        })
    </script>
  </c:when>

<%--  <c:otherwise>--%>
<%--    <script>--%>
<%--        Swal.fire({--%>
<%--            title: 'Error!',--%>
<%--            text: 'Something Went Wrong!.',--%>
<%--            icon: 'error',--%>
<%--            confirmButtonText: 'OK'--%>
<%--        })--%>
<%--    </script>--%>
<%--  </c:otherwise>--%>
</c:choose>



<div class="card text-center" style="margin-right: 5rem; margin-left: 5rem;">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item"><a class="nav-link active" id="addId" onclick="openAdd()" <%--href="/add"--%>>Add</a></li>
      <li class="nav-item"><a class="nav-link" id="viewId" onclick="openView()" <%--href="/view"--%>>View</a></li>
    </ul>
  </div>

  <div class="card-body">
    <div id="add">
      <form action="/addDepartment" method="post" id="addDepartmentForm">
        <h3 class="card-title">Department Details</h3>
        <div class="form">
          <div class="row g-3 m-4">
            <div class="col-md-4 control-label">
              <label for="departmentName" class="form-label control-label">Department Name</label>
              <input type="text" name="departmentName" class="form-control" id="departmentName" placeholder="Enter Department Name">
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



    <div id="view">
      <h3 class="card-title">Department Details</h3>
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Sl.No</th>
          <th>Department Name</th>
          <th>Staus</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${departmentList}" var="department" varStatus="count">
          <tr>
            <td>${count.count}</td>
            <td>${department.departmentName}</td>
            <td>${department.status}</td>
            <td>
              <a href = "/edit/${department.departmentId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16"><path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/></svg></a>
              |
              <a href = "/delete/${department.departmentId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
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
  function validateForm(){
    let departmentName = $('#departmentName').val();
    let status = $('#status').val();

    let departmentNameRegx = /^[a-zA-Z ]+$/;

    if(departmentName == ''){
      alert('Please Enter Department Name.');
      return false;
    }
    if (!departmentNameRegx.test(departmentName)) {
      alert('Please Enter a Valid Department Name.');
      return false;
    }
    if(status == ''){
      alert('Please Select Status.');
      return false;
    }
    $('#addDepartmentForm').submit();
  }
</script>
</html>
