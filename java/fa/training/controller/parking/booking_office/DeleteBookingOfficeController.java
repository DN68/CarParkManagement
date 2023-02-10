package fa.training.controller.parking.booking_office;

import fa.training.repository.BookingOfficeRepository;
import fa.training.repository.impl.BookingOfficeRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteBookingOfficeController", value = "/delete-booking-office")
public class DeleteBookingOfficeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Booking office");
        session.setAttribute("icon", "fa-cart-plus");

        BookingOfficeRepository repository = new BookingOfficeRepositoryImpl();
        int id = Integer.parseInt(request.getParameter("id"));
        repository.deleteBookingOffice(id);
        String urlHistory = (String) session.getAttribute("urlHistory");
        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The booking office was deleted successful!");
        // =================================
        response.sendRedirect(urlHistory);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
