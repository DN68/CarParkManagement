<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/3/2022
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>add employee</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
          integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="shortcut icon" href="./img/favicon.webp" type="image/x-icon">
    <link rel="stylesheet" href="./css/common/main.css">
    <link rel="stylesheet" href="./css/common/responsive-add-update.css">

</head>

<body>
<%--header--%>
<%@include file="../components/header-component.jsp" %>
<%--section--%>
<section>
    <%--sidebar--%>
        <%@include file="../components/sidebar-component.jsp" %>
    <main>
        <h1>Add Employee</h1>
        <hr>
        <form action="add-employee" method="POST">
            <div class="mb-3 row">
                <label for="fullName" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Full name <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="fullName" class="form-control input-group" id="fullName"
                           placeholder="Enter full name">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="phoneNumber" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Phone number <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="tel" name="phoneNumber" class="form-control input-group" id="phoneNumber"
                           placeholder="Enter phone number">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="dateOfBirth" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Date of birth <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="date" name="dateOfBirth" class="form-control input-group" id="dateOfBirth"
                           placeholder="Enter phone number">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="sex" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Sex <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10" style="line-height: 38px;">
                    <input type="radio" id="male" name="sex" value="1" checked>
                    <label for="male">Male</label>
                    <input type="radio" id="female" style="margin-left: 10px;" name="sex" value="0">
                    <label for="female">Female</label>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="address" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Address</strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="address" class="form-control input-group" id="address"
                           placeholder="Enter address">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="email" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Email</strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="email" class="form-control input-group" id="email"
                           placeholder="Enter email">
                    <small>${errorEmail}</small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="account" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Account <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="account" class="form-control input-group" id="account"
                           placeholder="Enter account">
                    <small>${errorAccount}</small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="password" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Password <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="password" name="password" class="form-control input-group" id="password"
                           placeholder="Enter password">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="department" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Department <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <select name="departmentId" class="form-control input-group" id="department"
                            aria-label="Default select example">
                        <c:forEach items="${listDepartments}" var="d">
                            <option value="${d.departmentId}">${d.departmentName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="mb-3 mx-5">
                <a class="btn btn-info text-light" href="${sessionScope.urlHistory}">
                    <i class="fa-solid fa-backward"></i> Back
                </a>
                <button class="mx-2 btn btn-warning text-light" type="reset">
                    <i class="fa-solid fa-arrow-rotate-left"></i>Reset
                </button>
                <button class="btn btn-success text-light" type="submit">
                    <i class="fa-solid fa-plus"></i>Add
                </button>
            </div>
        </form>
    </main>
</section>
<%@include file="../components/toast.jsp" %>
<script>
    document.querySelectorAll('.drop-nav').forEach((dropNav) => {
        dropNav.querySelector('.drop-nav-title').onclick = () => {
            dropNav.classList.toggle('drop')
        }
    })
</script>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/lib/lib-validate.js"></script>
<script src="./js/hrm/add-employee.js"></script>
<script src="./js/responsive/responsive.js"></script>

</html>