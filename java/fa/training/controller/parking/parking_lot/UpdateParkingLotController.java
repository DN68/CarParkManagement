package fa.training.controller.parking.parking_lot;

import fa.training.entity.ParkingLot;
import fa.training.repository.ParkingLotRepository;
import fa.training.repository.impl.ParkingLotRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateParkingLotController", value = "/update-parking-lot")
public class UpdateParkingLotController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ParkingLotRepository repository = new ParkingLotRepositoryImpl();
        session.setAttribute("pageName", "Parking lot");
        session.setAttribute("icon", "fa-solid fa-location-dot");

        int id = Integer.parseInt(request.getParameter("id"));
        ParkingLot parkingLot = repository.getParkingLotById(id);
        request.setAttribute("parkingLot", parkingLot);
        request.getRequestDispatcher("./html/parking/parking_lot/update-parking-lot.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("toastSuccess", false);
        ParkingLotRepository repository = new ParkingLotRepositoryImpl();
        int parkId = Integer.parseInt(request.getParameter("id"));
        String parkName = request.getParameter("parkName");
        String parkPlace = request.getParameter("parkPlace");
        int parkQuantity = Integer.parseInt(request.getParameter("parkQuantity"));
        int parkArea = Integer.parseInt(request.getParameter("parkArea"));
        double parkPrice = Double.parseDouble(request.getParameter("parkPrice"));
        int parkStatus = Integer.parseInt(request.getParameter("parkStatus"));

        ParkingLot parkingLot = ParkingLot.builder()
                .parkId(parkId)
                .parkQuantity(parkQuantity)
                .parkName(parkName)
                .parkPlace(parkPlace)
                .parkPrice(parkPrice)
                .parkArea(parkArea)
                .parkStatus(parkStatus)
                .build();

        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The parking lot was updated successful");
        // =================================

        repository.updateParkingLot(parkingLot);
        String urlHistory = (String) session.getAttribute("urlHistory");
        response.sendRedirect(urlHistory);

    }
}
