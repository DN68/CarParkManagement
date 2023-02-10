<%--
  Created by IntelliJ IDEA.
  User: tuana
  Date: 12/5/2022
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Parking lot</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css"
          integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
        <h1>Update Parking lot</h1>
        <hr>
        <form action="update-parking-lot" method="POST">
            <input type="hidden" value="${parkingLot.parkId}" name="id">
            <div class="mb-3 row">
                <label for="parkingName" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Parking name <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" class="form-control input-group" id="parkingName" name="parkName"
                           placeholder="Enter parking lot" value="${parkingLot.parkName}">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="place" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Place <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <input type="text" class="form-control input-group" id="place" name="parkPlace"
                           placeholder="Enter parking place" value="${parkingLot.parkPlace}">
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="quantity" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Quantity <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10 row">
                    <input type="number" min="0" style="margin-left: 12px;" class="form-control input-group col-8"
                           id="quantity" name="parkQuantity"
                           placeholder="Enter parking quantity" value="${parkingLot.parkQuantity}">
                    <small></small>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="area" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Area <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10 row">
                    <input type="number" min="0" style="margin-left: 12px;" class="form-control input-group col-8"
                           id="area" name="parkArea"
                           placeholder="Enter parking area" value="${parkingLot.parkArea}">
                    <strong class="mt-1 col-4">(m2)</strong>
                    <small></small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="price" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Price <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10 row">
                    <input type="number" step="0.0001" min="0" style="margin-left: 12px;"
                           class="form-control input-group col-8" id="price" name="parkPrice"
                           placeholder="Enter parking price" value="${parkingLot.parkPrice}">
                    <strong class="mt-1 col-4">(VNĐ)</strong>
                    <small></small>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="status" class="col-sm-3 col-md-3 col-lg-2 col-form-label">
                    <strong>Status <span class="text-danger">(*)</span></strong>
                </label>
                <div class="col-sm-9 col-md-9 col-lg-10">
                    <select class="form-control input-group col-md-8" id="status" name="parkStatus">
                        <option value="1" ${parkingLot.parkStatus == 1?"selected":""}>Activate</option>
                        <option value="2" ${parkingLot.parkStatus == 2?"selected":""}>Inactivate</option>
                        <option value="3" ${parkingLot.parkStatus == 3?"selected":""}>Deactivate</option>
                    </select>
                </div>
            </div>
            <div class="mb-3 mx-5 px-5 mt-5">
                <button class="mx-2 btn btn-warning text-light" type="reset">
                    <i class="fa-solid fa-arrow-rotate-left"></i>Reset
                </button>
                <button class="btn btn-success text-light" type="submit">
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
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/lib/lib-validate.js"></script>
<script src="./js/parking/add-update-parking-lot.js"></script>
<script src="./js/responsive/responsive.js"></script>

</html>
