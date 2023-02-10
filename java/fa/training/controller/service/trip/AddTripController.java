package fa.training.controller.service.trip;

import fa.training.entity.Trip;
import fa.training.repository.TripRepository;
import fa.training.repository.impl.TripRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddTripController", value = "/add-trip")
public class AddTripController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Trip");
        session.setAttribute("link", "add-trip");
        session.setAttribute("icon", "fa-solid fa-plane");
        request.getRequestDispatcher("./html/service/trip/add-trip.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("toastSuccess", false);
        TripRepository repository = new TripRepositoryImpl();
        String destination = request.getParameter("destination");
        String departureDate = request.getParameter("departureDate");
        String departureTime = request.getParameter("departureTime");
        String driver = request.getParameter("driver");
        String carType = request.getParameter("carType");
        int maximumTicketNumber = Integer.parseInt(request.getParameter("maximumTicketNumber"));

        Trip trip = Trip.builder()
                .destination(destination)
                .departureDate(departureDate)
                .departureTime(departureTime)
                .driver(driver)
                .carType(carType)
                .maxOnlineTickerNumber(maximumTicketNumber)
                .build();
        repository.addTrip(trip);
        String urlHistory = (String) session.getAttribute("urlHistory");

        if(!urlHistory.contains("trip")) {
            urlHistory = "list-trip";
        }

        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The trip was added successful");
        // =================================

        response.sendRedirect(urlHistory);
    }
}
