package fa.training.controller.parking.booking_office;

import fa.training.entity.BookingOffice;
import fa.training.entity.Search;
import fa.training.repository.BookingOfficeRepository;
import fa.training.repository.impl.BookingOfficeRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListBookingOfficeController", value = "/list-booking-office")
public class ListBookingOfficeController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Booking office");
        session.setAttribute("link", "list-booking-office");
        session.setAttribute("icon", "fa-cart-plus");

        BookingOfficeRepository repository = new BookingOfficeRepositoryImpl();

        String StringIndex = request.getParameter("page");
        if (StringIndex == null) {
            StringIndex = "1";
        }

        String txtSearch = request.getParameter("txtSearch");
        if (txtSearch == null) txtSearch = "";
        int option;
        String optionStr = request.getParameter("option");
        if (optionStr == null) {
            option = 0;
        } else option = Integer.parseInt(request.getParameter("option"));

        int index = Integer.parseInt(StringIndex);
        int size = repository.getTotalBookingOffice(option, txtSearch);
        int non = 10;
        int endP = size / non;
        if (size % non != 0) endP++;

        List<BookingOffice> listBookingOffice = repository.getListBookingOffice(index, non, option, txtSearch);

        ArrayList<Search> listSearch = new ArrayList<>(Arrays.asList(
                Search.builder().searchId(0).searchName("Name").build(),
                Search.builder().searchId(1).searchName("Trip").build()
        ));

        String urlHistory = "list-booking-office?page="+index+"&txtSearch="+txtSearch+"&option="+option;
        session.setAttribute("urlHistory", urlHistory);

        request.setAttribute("endP", endP);
        request.setAttribute("tag", index);
        request.setAttribute("option", option);
        request.setAttribute("listBookingOffices", listBookingOffice);
        request.setAttribute("listSearch", listSearch);
        request.setAttribute("txtSearch", txtSearch);

        request.getRequestDispatcher("./html/parking/booking_office/list-booking-office.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
