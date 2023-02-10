package fa.training.controller.parking.parking_lot;

import fa.training.repository.ParkingLotRepository;
import fa.training.repository.impl.ParkingLotRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteParkingLotController", value = "/delete-parking-lot")
public class DeleteParkingLotController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ParkingLotRepository repository = new ParkingLotRepositoryImpl();
        int id = Integer.parseInt(request.getParameter("id"));
        repository.deleteParkingLot(id);

        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The parking lot was deleted successful");
        // =================================

        String urlHistory = (String) session.getAttribute("urlHistory");
        response.sendRedirect(urlHistory);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
