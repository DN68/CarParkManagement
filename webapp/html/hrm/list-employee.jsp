<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/3/2022
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>employee list</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
          integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="shortcut icon" href="./img/favicon.webp" type="image/x-icon">
    <link rel="stylesheet" href="./css/common/main.css">
    <link rel="stylesheet" href="./css/common/list.css">
    <link rel="stylesheet" href="./css/common/responsive-list.css">

</head>

<body>
<%--header--%>
<%@include file="../components/header-component.jsp" %>
<%--section--%>
<section>
    <%--sidebar--%>
    <%@include file="../components/sidebar-component.jsp" %>
    <main>
        <h1>Employee List</h1>
        <hr>
        <div class="search-container">
            <form action="list-employee" method="POST">
                <div class="input-group rounded search__content" style="width:30%">
                    <button class="btn btn-info text-light">
                        <i class="fas fa-search m-0"></i></button>
                    <input type="search" name="txtSearch" class="form-control" value="${txtSearch}" placeholder="Search" aria-label="Search"
                           aria-describedby="search-addon"/>
                </div>

                <div class="filter-field border">
                    <label for="" class="border-0 text-black"><i class="fas fa-filter"></i>Filter by</label>
                    <select class="form-select" name="option">
                        <c:forEach items="${listSearch}" var="s">
                            <option value="${s.searchId}" ${s.searchId == option?"selected":""}>${s.searchName}</option>
                        </c:forEach>
                    </select>
                </div>

                <button class="btn btn-info text-light" type="submit">Search</button>
            </form>
        </div>
        <table class="table table-bordered table-hover mt-3">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Account</th>
                <th scope="col">Date of Birth</th>
                <th scope="col">Address</th>
                <th scope="col">Phone Number</th>
                <th scope="col">Sex</th>
                <th scope="col">Department</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listEmployees}" var="e">
                <tr>
                    <td scope="row">${e.employeeId}</td>
                    <td>${e.name}</td>
                    <td>${e.account}</td>
                    <td>${e.birthDate}</td>
                    <td>${e.address}</td>
                    <td>${e.phone}</td>
                    <td>${e.sex == true?"Male":"Female"}</td>
                    <td>${e.department.departmentName}</td>
                    <td class="process">
                        <a href="update-employee?id=${e.employeeId}" class="text-info view"><i
                                class="fa-solid fa-eye"></i>View</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="paging">
            <nav aria-label="...">
                <ul class="pagination">
                    <c:if test="${tag > 1}">
                        <li class="page-item">
                            <a class="page-link" href="list-employee?page=${tag - 1}&txtSearch=${txtSearch}&option=${option}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${endP}" var="i">
                        <li class="page-item ${tag == i?"active":""}">
                            <a class="page-link" href="list-employee?page=${i}&txtSearch=${txtSearch}&option=${option}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${tag < endP}">
                        <li class="page-item">
                            <a class="page-link" href="list-employee?page=${tag + 1}&txtSearch=${txtSearch}&option=${option}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
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
<script src="./js/responsive/responsive.js"></script>

</html>
