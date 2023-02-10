package fa.training.controller.parking.car;

import fa.training.entity.Car;
import fa.training.entity.ParkingLot;
import fa.training.entity.Trip;
import fa.training.repository.CarRepository;
import fa.training.repository.ParkingLotRepository;
import fa.training.repository.impl.CarRepositoryImpl;
import fa.training.repository.impl.ParkingLotRepositoryImpl;
import fa.training.repository.impl.TripRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddCarController", value = "/add-car")
public class AddCarController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Booking office");
        session.setAttribute("link", "add-car");
        session.setAttribute("icon", "fa-solid fa-car");

        ParkingLotRepository parkingLotRepository = new ParkingLotRepositoryImpl();
        List<ParkingLot> listParkingLots = parkingLotRepository.getListParkingLot();
        request.setAttribute("listParkingLots", listParkingLots);
        request.getRequestDispatcher("./html/parking/car/add-car.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CarRepository carRepository = new CarRepositoryImpl();
        session.setAttribute("toastSuccess", false);

        String licensePlate = request.getParameter("licensePlate");
        String carType = request.getParameter("carType");
        String carColor = request.getParameter("carColor");
        String company = request.getParameter("company");
        int parkingLot = Integer.parseInt(request.getParameter("parkingLot"));

        Car car = Car.builder()
                .licensePlate(licensePlate)
                .carType(carType)
                .carColor(carColor)
                .company(company)
                .park(ParkingLot.builder().parkId(parkingLot).build())
                .build();

        ParkingLot parkingLotById = new ParkingLotRepositoryImpl().getParkingLotById(car.getPark().getParkId());
        if(carRepository.countCarByParkId(parkingLot) < parkingLotById.getParkQuantity()) {
            carRepository.addCar(car);
            String urlHistory = (String) session.getAttribute("urlHistory");
            if(!urlHistory.contains("car")) {
                urlHistory = "list-car";
            }
            //=========== set toast ============
            session.setAttribute("toastSuccess", true);
            session.setAttribute("toastColor", "success");
            session.setAttribute("infoToast", "The car was added successful!");
            // =================================
            response.sendRedirect(urlHistory);
        }
        else {
            ParkingLotRepository parkingLotRepository = new ParkingLotRepositoryImpl();
            List<ParkingLot> listParkingLots = parkingLotRepository.getListParkingLot();
            //=========== set toast ============
            session.setAttribute("toastSuccess", true);
            session.setAttribute("toastColor", "danger");
            session.setAttribute("infoToast", "The parking was max slot");
            // =================================
            request.setAttribute("errorCar", "Parking is max slot");
            request.setAttribute("listParkingLots", listParkingLots);
            request.getRequestDispatcher("./html/parking/car/add-car.jsp").forward(request, response);
        }
    }
}
