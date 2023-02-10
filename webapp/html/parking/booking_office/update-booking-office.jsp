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
    <title>Update Booking office</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
          integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
        <h1>Update Booking office</h1>
        <hr>
        <form action="update-booking-office" method="POST">
            <input type="hidden" name="id" value="${bookingOffice.officeId}">
            <div class="mb-3 row">
                <label for="bookingOfficeName" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Booking office name <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" class="form-control input-group" id="bookingOfficeName" name="officeName"
                           placeholder="Enter booking office name" value="${bookingOffice.officeName}">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="trip" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Trip <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <select class="form-control input-group" id="trip" name="trip" aria-label="Default select example">
                        <%--                        <option value="${bookingOffice.trip.tripId}" selected>${bookingOffice.trip.destination}</option>--%>
                        <c:forEach items="${listTrips}" var="t">
                            <option value="${t.tripId}" ${t.tripId == bookingOffice.trip.tripId?"selected":""}>${t.destination}</option>
                        </c:forEach>
                        <%--                        <option value="1">Gia Lai</option>--%>
                        <%--                        <option value="2">Two</option>--%>
                        <%--                        <option value="3">Three</option>--%>
                    </select>
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="phoneNumber" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Phone number <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="tel" class="form-control input-group" id="phoneNumber" name="officePhone"
                           placeholder="Enter phone number" value="${bookingOffice.officePhone}">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="bookingOfficeName" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Place <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" class="form-control input-group" id="place" name="officePlace"
                           placeholder="Enter booking office place" value="${bookingOffice.officePlace}">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="price" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Price <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10 row">
                    <input type="number" style="margin-left: 12px;" class="form-control input-group col-8" id="price" name="officePrice"
                           placeholder="Enter price" value="${bookingOffice.officePrice}">
                    <strong class=" mt-1 col-4">(VNĐ)</strong>
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="contractDeadline" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Contract deadline <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <div class="input-date mt-3">
                        <label for="fromDate" class="border-0 text-black">From date</label>
                        <input type="date" class="form-control input-group border_input" id="fromDate" name="fromDate"
                               value="${bookingOffice.startContract}">
                        <small></small>
                    </div>
                    <div class="input-date mt-3">
                        <label for="toDate" class="border-0 text-black">To date</label>
                        <input type="date" class="form-control input-group border_input" id="toDate" name="toDate"
                               value="${bookingOffice.endContract}">
                        <small></small>
                    </div>

                </div>
            </div>
            <div class="mb-3 mx-5 px-5 mt-5">
                <a class="btn btn-info text-light" href="${sessionScope.urlHistory}">
                    <i class="fa-solid fa-backward"></i>Back
                </a>
                <%--                <a class="mx-2 btn btn-danger text-light" href="#">--%>
                <%--                    <i class="fa-solid fa-arrow-rotate-left"></i>Delete--%>
                <%--                </a>--%>

                <!-- Button trigger modal -->
                <a type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#bookingOffice${bookingOffice.officeId}">
                    <i class="fa-solid fa-arrow-rotate-left"></i>Delete
                </a>

                <!-- Modal -->
                <div class="modal fade" id="bookingOffice${bookingOffice.officeId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-danger" id="exampleModalLabel">Notice !</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Confirm delete Booking Office with id = ${bookingOffice.officeId}        </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <a class="mx-2 btn btn-danger text-light" href="delete-booking-office?id=${bookingOffice.officeId}">
                                    <i class="fa-solid fa-arrow-rotate-left"></i>Delete
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <button class="btn btn-primary text-light" type="submit">
                    <i class="fa-solid fa-plus"></i>Update
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
<script src="./js/parking/add-update-booking-office.js"></script>
<script src="./js/responsive/responsive.js"></script>

</body>
</html>
