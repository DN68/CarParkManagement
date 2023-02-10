<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/3/2022
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Update</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
          integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
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
        <h1>Update Employee</h1>
        <hr>
        <form action="update-employee?id=${employee.employeeId}" method="POST">
            <input type="hidden" name="id" value="${employee.employeeId}">
            <div class="mb-3 row">
                <label for="fullName" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Full name <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="fullName" value="${employee.name}" class="form-control input-group"
                           id="fullName" placeholder="Enter full name">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="phoneNumber" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Phone number <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="tel" name="phoneNumber" value="${employee.phone}" class="form-control input-group"
                           id="phoneNumber"
                           placeholder="Enter phone number">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="dateOfBirth" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Date of birth <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="date" name="dateOfBirth" value="${employee.birthDate}" class="form-control input-group"
                           id="dateOfBirth"
                           placeholder="Enter date of birth">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="sex" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Sex <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10" style="line-height: 38px;">
                    <input type="radio" id="male" name="sex" value="true" ${employee.sex == true?"checked":""}>
                    <label for="male">Male</label>
                    <input type="radio" id="female" style="margin-left: 10px;" name="sex"
                           value="false" ${employee.sex == false?"checked":""}>
                    <label for="female">Female</label>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="address" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Address</strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="address" value="${employee.address}" class="form-control input-group"
                           id="address" placeholder="Enter address">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="email" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Email</strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="email" name="email" ${require==true?"readonly":""} value="${employee.email}"
                           class="form-control input-group" id="email" placeholder="Enter email">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="account" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Account <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" ${require==true?"readonly":""} name="account" value="${employee.account}"
                           class="form-control input-group" id="account" placeholder="Enter account">
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
                            <option value="${d.departmentId}" ${d.departmentId == employee.department.departmentId?"selected":""}>${d.departmentName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <c:if test="${require!=true}">
                <input id="checkbox_changepassword" type="checkbox" name="changePassword" value="1" ${error!=null?"checked":""} onchange="changePassFunction()"> Change Password
                <div id="change_password" style="display: none">
                    <br/>
                    <div class="mb-3 row">
                        <label for="account" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                            <strong>Current password <span class="text-danger">(*)</span></strong>
                        </label>
                        <div class="col-sm-9 col-md-9 col-lg-10">
                            <input type="password" name="password" id="password"
                                   class="form-control input-group" placeholder="Enter current password">
                            <small></small>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="account" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                            <strong>New password <span class="text-danger">(*)</span></strong>
                        </label>
                        <div class="col-sm-9 col-md-9 col-lg-10">
                            <input type="password" name="newPassword" id="newPassword"
                                   class="form-control input-group" placeholder="Enter New password">
                            <small></small>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="account" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                            <strong>Re-enter new password <span class="text-danger">(*)</span></strong>
                        </label>
                        <div class="col-sm-9 col-md-9 col-lg-10">
                            <input type="password" name="reNewPassword" id="reNewPassword"
                                   class="form-control input-group" placeholder="Re-enter new password">
                            <small></small>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </c:if>
            <div class="mb-3 mx-5">
                <a class="btn btn-info text-light" href="${sessionScope.urlHistory}">
                    <i class="fa-solid fa-backward"></i>Back
                </a>
                <a type="button" class="mx-2 btn btn-danger text-light" data-bs-toggle="modal"
                   data-bs-target="#employee${employee.employeeId}">
                    <i class="fa-solid fa-arrow-rotate-left"></i>Delete
                </a>

                <!-- Modal -->
                <div class="modal fade" id="employee${employee.employeeId}" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-danger" id="exampleModalLabel">Notice !</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Confirm delete Employee with id = ${employee.employeeId}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <a class="mx-2 btn btn-danger text-light"
                                   href="delete-employee?id=${employee.employeeId}">
                                    <i class="fa-solid fa-arrow-rotate-left"></i>Delete
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <button class="btn btn-primary text-light" type="submit">
                    <i class="fa-solid fa-plus"></i>Update
                </button>
                <c:if test="${resetPassword == true}">
                    <button class="btn btn-warning text-light" type="submit" name="resetPassword" value="reset">
                        <i class="fa-solid fa-plus"></i>Reset password
                    </button>
                </c:if>
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
<script>
    function changePassFunction() {
        if (document.getElementById("checkbox_changepassword").checked) {
            document.getElementById("change_password").style.display = "block";
        } else {
            document.getElementById("change_password").style.display = "none";
        }
    }
    checkbox_changepassword.addEventListener('change', changePassFunction);
    document.addEventListener('DOMContentLoaded', changePassFunction);
    changePassFunction();
</script>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/lib/lib-validate.js"></script>
<script src="./js/hrm/update-employee.js"></script>
<script src="./js/responsive/responsive.js"></script>

</html>
