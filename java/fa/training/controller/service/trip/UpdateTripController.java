package fa.training.controller.service.trip;

import fa.training.entity.Trip;
import fa.training.repository.TripRepository;
import fa.training.repository.impl.TripRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateTripController", value = "/update-trip")
public class UpdateTripController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("toastSuccess", false);
        TripRepository repository = new TripRepositoryImpl();
        session.setAttribute("pageName", "Trip");
        session.setAttribute("icon", "fa-solid fa-plane");

        int id = Integer.parseInt(request.getParameter("id"));
        Trip trip = repository.getTripById(id);
        request.setAttribute("trip", trip);
        request.getRequestDispatcher("./html/service/trip/update-trip.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        TripRepository repository = new TripRepositoryImpl();
        int tripId = Integer.parseInt(request.getParameter("id"));
        String destination = request.getParameter("destination");
        String departureDate = request.getParameter("departureDate");
        String departureTime = request.getParameter("departureTime");
        String driver = request.getParameter("driver");
        String carType = request.getParameter("carType");
        int maximumTicketNumber = Integer.parseInt(request.getParameter("maximumTicketNumber"));

        Trip trip = Trip.builder()
                .tripId(tripId)
                .destination(destination)
                .departureDate(departureDate)
                .departureTime(departureTime)
                .driver(driver)
                .carType(carType)
                .maxOnlineTickerNumber(maximumTicketNumber)
                .build();
        repository.updateTrip(trip);
        String urlHistory = (String) session.getAttribute("urlHistory");
        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The trip was updated successful");
        // =================================
        response.sendRedirect(urlHistory);
    }
}
