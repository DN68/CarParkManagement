<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/3/2022
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <div class="logo-container d-flex">
        <h4 class="mt-2"><a href="${sessionScope.link}"><i class="fa-solid ${sessionScope.icon}"></i>${sessionScope.pageName}</a></h4>
    </div>
    <div class="content">
        <span>Welcome <a href="update-employee?id=${sessionScope.employee.employeeId}">${sessionScope.employee.name}</a></span>
        <span><a href="logout"><i class="fas fa-sign-out-alt"></i>Logout</a></span>
    </div>
    <button class="btn btn-light btn-list my-auto" id="btn-sideBar"><i class="fa-solid fa-bars"></i></button>
</header>
