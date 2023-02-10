package fa.training.controller.service.trip;

import fa.training.entity.Trip;
import fa.training.repository.EmployeeRepository;
import fa.training.repository.TripRepository;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import fa.training.repository.impl.TripRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteTripController", value = "/delete-trip")
public class DeleteTripController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        TripRepository repository = new TripRepositoryImpl();
        int id = Integer.parseInt(request.getParameter("id"));
        repository.deleteTrip(id);
        String urlHistory = (String) session.getAttribute("urlHistory");

        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The trip was deleted successful");
        // =================================

        response.sendRedirect(urlHistory);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
