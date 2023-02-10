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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateTicketController", value = "/update-ticket")
public class UpdateTicketController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        TicketRepository repositoryTicket = new TicketRepositoryImpl();
        TripRepository repositoryTrip = new TripRepositoryImpl();
        CarRepository repositoryCar = new CarRepositoryImpl();

        session.setAttribute("pageName", "Ticket");
        session.setAttribute("icon", "fa-solid fa-ticket");

        int id = Integer.parseInt(request.getParameter("id")); //ticketId ticket_id ticket-id
        Ticket ticket = repositoryTicket.getTicketById(id);
        List<Trip> listTrips = repositoryTrip.getAllTrip();
        List<Car> listCars = repositoryCar.getAllLicense();

        request.setAttribute("ticket", ticket);
        request.setAttribute("listTrips", listTrips);
        request.setAttribute("listCars", listCars);
        request.setAttribute("tripIdTemp", ticket.getTrip().getTripId());
        request.setAttribute("licensePlateTemp", ticket.getCar().getLicensePlate());

        System.out.println(ticket);
        System.out.println(listCars);
        System.out.println(listTrips);

        request.getRequestDispatcher("./html/service/ticket/update-ticket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("toastSuccess", false);
        TicketRepository repository = new TicketRepositoryImpl();

        int ticketId = Integer.parseInt(request.getParameter("tid"));
        String customerName = request.getParameter("name");
        String bookingTime = request.getParameter("time");
        int tripId = Integer.parseInt(request.getParameter("tripId"));
        String license = request.getParameter("licensePlate");

        Ticket ticket = Ticket.builder()
                .ticketId(ticketId)
                .bookingTime(bookingTime)
                .customerName(customerName)
                .car(Car.builder().licensePlate(license).build())
                .trip(Trip.builder().tripId(tripId).build())
                .build();

        repository.updateTicket(ticket);
        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The ticket was updated successful");
        // =================================

        String urlHistory = (String) session.getAttribute("urlHistory");
        response.sendRedirect(urlHistory);
    }
}
