<%--
  Created by IntelliJ IDEA.
  User: sambit.pradhan
  Date: 9/1/2022
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Home</title>
</head>
<body style="margin: 5rem;">
<div class="col-md-12 control-label">
  <div class="text-center">
    <h3 style="font-family: 'Segoe UI Semibold',serif">Home</h3>
    <a href="${pageContext.request.contextPath}/addDepartment"><button class="btn btn-primary">Add Department</button></a>
    <a href="${pageContext.request.contextPath}/addCollege"><button class="btn btn-primary">Add College</button></a>
    <a href="${pageContext.request.contextPath}/studentRegistration"><button class="btn btn-primary">Student Registration</button></a>
    <a href="${pageContext.request.contextPath}/addLecturer"><button class="btn btn-primary">Lecturer Registration</button></a>
  </div>
</div>
</body>
</html>
