<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/4/2022
  Time: 1:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Ticket</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
          integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="./img/favicon.webp" type="image/x-icon">
    <link rel="stylesheet" href="./css/common/main.css">
    <link rel="stylesheet" href="./css/common/list.css">
    <link rel="stylesheet" href="./css/common/responsive-add-update.css">

</head>
<body>
<%--header--%>
<%@include file="../../components/header-component.jsp" %>
<%--section--%>
<section>
    <%--sidebar--%>
    <%@include file="../../components/sidebar-component.jsp" %>
    <main>
        <h1>Add Ticket</h1>
        <hr>
        <form action="add-ticket" method="post">
            <div class="mb-3 row">
                <label for="customerName" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Customer <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" class="form-control input-group" id="customerName" name="name"
                           placeholder="Enter customer name">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="bookingTime" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Booking time <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="time" class="form-control input-group" id="bookingTime" name="time">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="trip" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Trip <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <select name="tripId" class="form-control input-group"
                            aria-label="Default select example" id="trip">
                        <c:forEach items="${tripList}" var="tl">
                            <option value="${tl.tripId}">${tl.destination}</option>
                        </c:forEach>

                    </select>
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="licensePlate" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>License plate <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <select name="licensePlate" class="form-control input-group"
                            aria-label="Default select example" id="licensePlate">
                        <c:forEach items="${carList}" var="cl">
                            <option value="${cl.licensePlate}">${cl.licensePlate}</option>
                        </c:forEach>

                    </select>

                    <small></small>
                </div>
            </div>
            <div class="mb-3 row">
                <p style="color: red;">${errorTicket}</p>
            </div>
            <div class="mb-3 mx-5 px-5 mt-5">
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

<script>
    document.querySelectorAll('.drop-nav').forEach((dropNav) => {
        dropNav.querySelector('.drop-nav-title').onclick = () => {
            dropNav.classList.toggle('drop')
        }
    })
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/lib/lib-validate.js"></script>
<script src="./js/service/ticket/add-update-ticket.js"></script>
<script src="./js/responsive/responsive.js"></script>

</body>
</html>
