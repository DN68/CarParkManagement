package fa.training.controller.parking.parking_lot;

import fa.training.entity.ParkingLot;
import fa.training.repository.ParkingLotRepository;
import fa.training.repository.impl.ParkingLotRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddParkingLotController", value = "/add-parking-lot")
public class AddParkingLotController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Parking lot");
        session.setAttribute("link", "add-parking-lot");
        session.setAttribute("icon", "fa-solid fa-location-dot");

        request.getRequestDispatcher("./html/parking/parking_lot/add-parking-lot.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ParkingLotRepository repository = new ParkingLotRepositoryImpl();
        session.setAttribute("toastSuccess", false);

        String parkName = request.getParameter("parkName");
        String parkPlace = request.getParameter("parkPlace");
        int parkQuantity = Integer.parseInt(request.getParameter("parkQuantity"));
        int parkArea = Integer.parseInt(request.getParameter("parkArea"));
        double parkPrice = Double.parseDouble(request.getParameter("parkPrice"));


        ParkingLot parkingLot = ParkingLot.builder()
                .parkQuantity(parkQuantity)
                .parkArea(parkArea)
                .parkName(parkName)
                .parkPlace(parkPlace)
                .parkPrice(parkPrice)
                .parkStatus(1)
                .build();

        repository.addParkingLot(parkingLot);
        String urlHistory = (String) session.getAttribute("urlHistory");

        if(!urlHistory.contains("parking-lot")) {
            urlHistory = "list-parking-lot";
        }

        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The parking lot was added successful");
        // =================================

        response.sendRedirect(urlHistory);
    }

}
