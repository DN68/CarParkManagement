package fa.training.controller.parking.booking_office;

import fa.training.entity.BookingOffice;
import fa.training.entity.Trip;
import fa.training.repository.BookingOfficeRepository;
import fa.training.repository.TripRepository;
import fa.training.repository.impl.BookingOfficeRepositoryImpl;
import fa.training.repository.impl.TripRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateBookingOfficeController", value = "/update-booking-office")
public class UpdateBookingOfficeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Booking office");
        session.setAttribute("icon", "fa-cart-plus");

        BookingOfficeRepository repository = new BookingOfficeRepositoryImpl();
        TripRepository tripRepository = new TripRepositoryImpl();

        int id = Integer.parseInt(request.getParameter("id"));
        BookingOffice bookingOffice = repository.getBookingOfficeById(id);
        List<Trip> listTrips = tripRepository.getListTrip();

        request.setAttribute("bookingOffice", bookingOffice);
        request.setAttribute("listTrips", listTrips);
        request.getRequestDispatcher("./html/parking/booking_office/update-booking-office.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        BookingOfficeRepository repository = new BookingOfficeRepositoryImpl();
        session.setAttribute("toastSuccess", false);

        int id = Integer.parseInt(request.getParameter("id"));
        String officeName = request.getParameter("officeName");
        String officePhone = request.getParameter("officePhone");
        String officePlace = request.getParameter("officePlace");
        Double officePrice=Double.parseDouble(request.getParameter("officePrice"));
        String fromDate=request.getParameter("fromDate");
        String toDate=request.getParameter("toDate");
        Integer trip_id=Integer.parseInt(request.getParameter("trip"));

        BookingOffice bookingOffice= BookingOffice.builder()
                .officeId(id)
                .officeName(officeName)
                .officePhone(officePhone)
                .officePlace(officePlace)
                .officePrice(officePrice)
                .startContract(fromDate)
                .endContract(toDate)
                .trip(Trip.builder().tripId(trip_id).build())
                .build();
        repository.updateBookingOffice(bookingOffice);
        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The booking office was updated successful!");
        // =================================
        String urlHistory = (String)session.getAttribute("urlHistory");
        response.sendRedirect(urlHistory);
    }
}
