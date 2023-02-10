package fa.training.controller.service.ticket;

import fa.training.entity.Car;
import fa.training.entity.Ticket;
import fa.training.entity.Trip;
import fa.training.repository.CarRepository;
import fa.training.repository.TicketRepository;
import fa.training.repository.TripRepository;
import fa.training.repository.impl.CarRepositoryImpl;
import fa.training.repository.impl.TicketRepositoryImpl;
import fa.training.repository.impl.TripRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddTicketController", value = "/add-ticket")
public class AddTicketController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Ticket");
        session.setAttribute("link", "add-ticket");
        session.setAttribute("icon", "fa-solid fa-ticket");

        TripRepository trip= new TripRepositoryImpl();
        CarRepository car= new CarRepositoryImpl();
        List<Trip> tripList= trip.getAllTrip();
        List<Car>  carList= car.getAllLicense();
        request.setAttribute("tripList",tripList);
        request.setAttribute("carList",carList);

        request.getRequestDispatcher("./html/service/ticket/add-ticket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("toastSuccess", false);
        TicketRepository repository= new TicketRepositoryImpl();
        String customername= request.getParameter("name");
        String time= request.getParameter("time");
        int tripID= Integer.parseInt(request.getParameter("tripId"));
        String license= request.getParameter("licensePlate");
        Ticket ticket= Ticket.builder().customerName(customername)
                .bookingTime(time)
                .trip(Trip.builder().tripId(tripID).build())
                .car(Car.builder().licensePlate(license).build()).build();

        Trip trip = new TripRepositoryImpl().getTripById(tripID);
        if(trip.getBookedTicketNumber() < trip.getMaxOnlineTickerNumber()) {
            repository.addTicket(ticket);
            String urlHistory = (String) session.getAttribute("urlHistory");
            if(!urlHistory.contains("ticket")) {
                urlHistory = "list-ticket";
            }
            //=========== set toast ============
            session.setAttribute("toastSuccess", true);
            session.setAttribute("toastColor", "success");
            session.setAttribute("infoToast", "The trip was added successful");
            // =================================
            response.sendRedirect(urlHistory);
        }
        else {
            CarRepository car= new CarRepositoryImpl();
            List<Trip> tripList= new TripRepositoryImpl().getAllTrip();
            List<Car>  carList= car.getAllLicense();
            request.setAttribute("tripList",tripList);
            request.setAttribute("carList",carList);

            //=========== set toast ============
            session.setAttribute("toastSuccess", true);
            session.setAttribute("toastColor", "danger");
            session.setAttribute("infoToast", "The trip was max slot");
            // =================================

            request.getRequestDispatcher("./html/service/ticket/add-ticket.jsp").forward(request, response);
        }
    }
}
