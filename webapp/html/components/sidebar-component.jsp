<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/3/2022
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="sidebar transformX-100" id="sidebar">
    <ul class="p-0">
        <li class="drop-nav account">
            <div class="drop-nav-title"><i class="fa-solid fa-user-large"></i>
                ${sessionScope.employee.name}<i class="fas fa-angle-left"></i>
            </div>
            <ul class="drop-nav-links p-0">
                <li class="drop-nav-link">
                    <a href="logout"><i class="fas fa-sign-out-alt"></i>Logout</a>
                </li>
            </ul>
        </li>
        <c:if test="${sessionScope.employee.department.departmentId == 1 ||
                    sessionScope.employee.department.departmentId == 2}">
            <li class="drop-nav">
                <div class="drop-nav-title">
                    <i class="fas fa-tachometer-alt"></i>Dashboard<i class="fas fa-anle-left"></i>
                </div>
            </li>
            <li class="drop-nav ${sessionScope.link eq 'list-employee'?"drop":""} ${sessionScope.link eq 'add-employee'?"drop":""}">
                <div class="drop-nav-title"><i class="fa-solid fa-chart-column">
                </i> Employee manager<i class="fas fa-angle-left"></i>
                </div>
                <ul class="drop-nav-links p-0">
                    <li class="drop-nav-link ${sessionScope.link eq 'list-employee'?"active":""}">
                        <a class="text-decoration-none" href="list-employee">
                            <i class="fas fa-list"></i>Employee list
                        </a>
                    </li>
                    <li class="drop-nav-link ${sessionScope.link eq 'add-employee'?"active":""}">
                        <a class="text-decoration-none" href="add-employee"><i class="fas fa-plus"></i>Add Employee</a>
                    </li>
                </ul>
            </li>
        </c:if>

        <c:if test="${sessionScope.employee.department.departmentId == 1 ||
                            sessionScope.employee.department.departmentId == 3}">
            <li class="drop-nav ${sessionScope.link eq 'list-car'?"drop":""} ${sessionScope.link eq 'add-car'?"drop":""}">
                <div class="drop-nav-title"><i class="fa-solid fa-car">
                </i>Car manager<i class="fas fa-angle-left"></i>
                </div>
                <ul class="drop-nav-links p-0">
                    <li class="drop-nav-link ${sessionScope.link eq 'list-car'?"active":""}">
                        <a class="text-decoration-none" href="list-car">
                            <i class="fas fa-list"></i>Car list
                        </a>
                    </li>
                    <li class="drop-nav-link ${sessionScope.link eq 'add-car'?"active":""}">
                        <a class="text-decoration-none w-100" href="add-car"><i class="fas fa-plus"></i>
                            Add Car</a>
                    </li>
                </ul>
            </li>
            <li class="drop-nav ${sessionScope.link eq 'list-booking-office'?"drop":""} ${sessionScope.link eq 'add-booking-office'?"drop":""}">
                <div class="drop-nav-title"><i class="fa-solid fa-cart-plus">
                </i>Booking office manager<i class="fas fa-angle-left"></i>
                </div>
                <ul class="drop-nav-links p-0">
                    <li class="drop-nav-link ${sessionScope.link eq 'list-booking-office'?"active":""}">
                        <a class="text-decoration-none" href="list-booking-office">
                            <i class="fas fa-list"></i>Booking office list
                        </a>
                    </li>
                    <li class="drop-nav-link ${sessionScope.link eq 'add-booking-office'?"active":""}">
                        <a class="text-decoration-none w-100" href="add-booking-office"><i
                                class="fas fa-plus"></i>
                            Add Booking office</a>
                    </li>
                </ul>
            </li>
            <li class="drop-nav ${sessionScope.link eq 'list-parking-lot'?"drop":""} ${sessionScope.link eq 'add-parking-lot'?"drop":""}">
                <div class="drop-nav-title"><i class="fa-solid fa-location-dot">
                </i>Parking lot manager<i class="fas fa-angle-left"></i>
                </div>
                <ul class="drop-nav-links p-0">
                    <li class="drop-nav-link ${sessionScope.link eq 'list-parking-lot'?"active":""}">
                        <a class="text-decoration-none" href="list-parking-lot">
                            <i class="fas fa-list"></i>Parking lot list
                        </a>
                    </li>
                    <li class="drop-nav-link ${sessionScope.link eq 'add-parking-lot'?"active":""}">
                        <a class="text-decoration-none w-100" href="add-parking-lot"><i class="fas fa-plus"></i>
                            Add Parking lot</a>
                    </li>
                </ul>
            </li>
        </c:if>

        <c:if test="${sessionScope.employee.department.departmentId == 1 ||
                                    sessionScope.employee.department.departmentId == 4}">
            <li class="drop-nav ${sessionScope.link eq 'list-trip'?"drop":""} ${sessionScope.link eq 'add-trip'?"drop":""}">
                <div class="drop-nav-title"><i class="fa-solid fa-plane"></i>
                    Trip manager<i class="fas fa-angle-left"></i>
                </div>
                <ul class="drop-nav-links p-0">
                    <li class="drop-nav-link ${sessionScope.link eq 'list-trip'?"active":""}">
                        <a class="text-decoration-none" href="list-trip">
                            <i class="fas fa-list"></i>Trip list
                        </a>
                    </li>
                    <li class="drop-nav-link ${sessionScope.link eq 'add-trip'?"active":""}">
                        <a class="text-decoration-none w-100" href="add-trip"><i class="fas fa-plus"></i>
                            Add Trip</a>
                    </li>
                </ul>
            </li>
            <li class="drop-nav ${sessionScope.link eq 'list-ticket'?"drop":""} ${sessionScope.link eq 'add-ticket'?"drop":""}">
                <div class="drop-nav-title"><i class="fa-solid fa-ticket"></i>
                    Ticket manager<i class="fas fa-angle-left"></i>
                </div>
                <ul class="drop-nav-links p-0">
                    <li class="drop-nav-link ${sessionScope.link eq 'list-ticket'?"active":""}">
                        <a class="text-decoration-none" href="list-ticket">
                            <i class="fas fa-list"></i>Ticket list
                        </a>
                    </li>
                    <li class="drop-nav-link ${sessionScope.link eq 'add-ticket'?"active":""}">
                        <a class="text-decoration-none w-100" href="add-ticket"><i class="fas fa-plus"></i>
                            Add Ticket</a>
                    </li>
                </ul>
            </li>
        </c:if>
    </ul>
    <button class="d-none close" id="close"><i class="fa-solid fa-xmark"></i></button>
</nav>
<div id="overlay"></div>
