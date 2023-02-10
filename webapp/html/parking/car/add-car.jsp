<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/4/2022
  Time: 1:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
          integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="shortcut icon" href="./img/favicon.webp" type="image/x-icon">
    <link rel="stylesheet" href="./css/common/main.css">
    <link rel="stylesheet" href="./css/common/add.css">
    <link rel="stylesheet" href="./css/common/responsive-add-update.css">

</head>
<body>
<%@include file="../../components/header-component.jsp" %>
<%--section--%>
<section>
    <%--sidebar--%>
    <%@include file="../../components/sidebar-component.jsp" %>
    <main>
        <h1>Add Car</h1>
        <hr>
        <form action="add-car" method="POST">
            <div class="mb-3 row">
                <label for="licensePlate" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>License plate <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="licensePlate" class="form-control input-group" id="licensePlate"
                           placeholder="Enter license plate">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="carType" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Car type </strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="carType" class="form-control input-group" id="carType"
                           placeholder="Enter car type">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="carColor" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Car color </strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="carColor" class="form-control input-group" id="carColor"
                           placeholder="Enter car color">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="company" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Company<span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" name="company" class="form-control input-group" id="company"
                           placeholder="Enter car company">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="parkingLot" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Parking lot <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <select name="parkingLot" class="form-control input-group" id="parkingLot" aria-label="Default select example">
                        <c:forEach items="${listParkingLots}" var="p">
                            <option value="${p.parkId}">${p.parkName}</option>
                        </c:forEach>
                    </select>
                    <small></small>
                </div>
            </div>
<%--            <div class="mb-3 row">--%>
<%--                <p style="color: red">${errorCar}</p>--%>
<%--            </div>--%>
            <div class="mb-3 mx-5 px-5 mt-5">
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
<%@include file="../../components/toast.jsp" %>
<script>
    document.querySelectorAll('.drop-nav').forEach((dropNav) => {
        dropNav.querySelector('.drop-nav-title').onclick = () => {
            dropNav.classList.toggle('drop')
        }
    })
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/lib/lib-validate.js"></script>
<script src="./js/parking/add-update-car.js"></script>
<script src="./js/responsive/responsive.js"></script>

</body>
</html>
