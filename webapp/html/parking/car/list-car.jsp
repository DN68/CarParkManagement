<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/4/2022
  Time: 1:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
          integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="./img/favicon.webp" type="image/x-icon">
    <link rel="stylesheet" href="./css/common/main.css">
    <link rel="stylesheet" href="./css/common/list.css">
    <link rel="stylesheet" href="./css/common/responsive-list.css">

</head>
<body>
<%--header--%>
<%@include file="../../components/header-component.jsp" %>
<%--section--%>
<section>
    <%--sidebar--%>
    <%@include file="../../components/sidebar-component.jsp" %>
    <main>
        <h1>Car List</h1>
        <hr>
        <div class="search-container">
            <form action="#">
                <div class="input-group rounded search__content" style="width:30%">
                    <button class="btn btn-info text-light" type="submit">
                        <i class="fas fa-search m-0"></i></button>
                    <input type="search" name="txtSearch" class="form-control" value="${txtSearch}" placeholder="Car Search" aria-label="Search"
                           aria-describedby="search-addon" />
                </div>

                <div class="filter-field border">
                    <label for="" class="border-0 text-black"><i class="fas fa-filter"></i>Filter by</label>
                    <select class="form-select" name="option" id="">
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
                <th scope="col">License plate</th>
                <th scope="col">Car type</th>
                <th scope="col">Car color</th>
                <th scope="col">Company</th>
                <th scope="col">Parking lot</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listCars}" var="c">
                <tr>
                    <td scope="row">${c.licensePlate}</td>
                    <td>${c.carType}</td>
                    <td>${c.carColor}</td>
                    <td>${c.company}</td>
                    <td>${c.park.parkName}</td>
                    <td class="process">
                        <a href="update-car?licensePlate=${c.licensePlate}" class="view"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
<%--                        <a href="delete-car?licensePlate=${c.licensePlate}" class="view"><i class="fa-solid fa-trash-can"></i>Delete</a>--%>
                        <a type="button" class="view" data-bs-toggle="modal" data-bs-target="#car${c.licensePlate}">
                            <i class="fa-solid fa-trash-can"></i>Delete
                        </a>

                        <!-- Modal -->
                        <div class="modal fade" id="car${c.licensePlate}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-danger" id="exampleModalLabel">Notice !</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Confirm delete Employee with id = ${c.licensePlate}        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <a class="mx-2 btn btn-danger text-light" href="delete-car?licensePlate=${c.licensePlate}">
                                            <i class="fa-solid fa-arrow-rotate-left"></i>Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                            <a class="page-link" href="list-car?page=${tag - 1}&txtSearch=${txtSearch}&option=${option}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${endP}" var="i">
                        <li class="page-item ${tag == i?"active":""}">
                            <a class="page-link" href="list-car?page=${i}&txtSearch=${txtSearch}&option=${option}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${tag < endP}">
                        <li class="page-item">
                            <a class="page-link" href="list-car?page=${tag + 1}&txtSearch=${txtSearch}&option=${option}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </main>
</section>
<%@include file="../../components/toast.jsp" %>
<script>
    document.querySelectorAll('.drop-nav').forEach((dropNav) => {
        dropNav.querySelector('.drop-nav-title').onclick = () => {
            dropNav.classList.toggle('drop')
        }
    })
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/responsive/responsive.js"></script>

</body>
</html>
