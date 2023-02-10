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
    <title>Add Trip</title>
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
<%--header--%>
<%@include file="../../components/header-component.jsp" %>
<%--section--%>
<section>
    <%--sidebar--%>
    <%@include file="../../components/sidebar-component.jsp" %>
        <main>
            <h1>Add Trip</h1>
            <hr>
            <form action="add-trip" method="POST">
                <div class="mb-3 row">
                    <label for="destination" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                        <strong>Destination <span class="text-danger">(*)</span></strong>
                    </label>
                    <div class="col-sm-9 col-md-9 col-lg-10">
                        <input type="text" name="destination" class="form-control input-group" id="destination"
                               placeholder="Enter destination">
                        <small></small>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="departureDate" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                        <strong>Departure date <span class="text-danger">(*)</span></strong>
                    </label>
                    <div class="col-sm-9 col-md-9 col-lg-10">
                        <input type="date" name="departureDate" class="form-control input-group" id="departureDate"
                               placeholder="0">
                        <small></small>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="departureTime" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                        <strong>Departure time <span class="text-danger">(*)</span></strong>
                    </label>
                    <div class="col-sm-9 col-md-9 col-lg-10">
                        <input type="time" name="departureTime" class="form-control input-group" id="departureTime">
                        <small></small>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="driver" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                        <strong>Driver <span class="text-danger">(*)</span></strong>
                    </label>
                    <div class="col-sm-9 col-md-9 col-lg-10">
                        <input type="text" name="driver" class="form-control input-group" id="driver"
                               placeholder="Enter driver">
                        <small></small>
                    </div>
                </div>

                <div class="mb-1 row">
                    <label for="carType" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                        <strong>Car type <span class="text-danger">(*)</span></strong>
                    </label>
                    <div class="col-sm-9 col-md-9 col-lg-10">
                        <input type="text" name="carType" class="form-control input-group" id="carType"
                               placeholder="Enter car type">
                        <small></small>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="maxTicketNumber" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                        <strong>Maximum online ticket number <span class="text-danger">(*)</span></strong>
                    </label>
                    <div class="col-sm-9 col-md-9 col-lg-10 mt-3">
                        <input type="number" name="maximumTicketNumber" class="form-control input-group" id="maxTicketNumber"
                               placeholder="Enter maximum online ticket number">
                        <small></small>
                    </div>
                </div>
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

<script>
    document.querySelectorAll('.drop-nav').forEach((dropNav) => {
        dropNav.querySelector('.drop-nav-title').onclick = () => {
            dropNav.classList.toggle('drop')
        }
    })
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/lib/lib-validate.js"></script>
<script src="./js/service/trip/add-update-trip.js"></script>
<script src="./js/responsive/responsive.js"></script>

</body>
</html>
