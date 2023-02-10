package fa.training.controller.parking.car;

import fa.training.entity.Car;
import fa.training.entity.ParkingLot;
import fa.training.repository.CarRepository;
import fa.training.repository.ParkingLotRepository;
import fa.training.repository.impl.CarRepositoryImpl;
import fa.training.repository.impl.ParkingLotRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateCarController", value = "/update-car")
public class UpdateCarController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Car");
        session.setAttribute("icon", "fa-solid fa-car");

        CarRepository carRepository = new CarRepositoryImpl();
        ParkingLotRepository parkingLotRepository = new ParkingLotRepositoryImpl();

        String licensePlate = request.getParameter("licensePlate");
        Car car = carRepository.getCarBylicense_plate(licensePlate);
        request.setAttribute("car", car);

        List<ParkingLot> listParkingLots = parkingLotRepository.getListParkingLot();
        request.setAttribute("listParkingLots", listParkingLots);

        request.getRequestDispatcher("./html/parking/car/update-car.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CarRepository carRepository = new CarRepositoryImpl();

        String oldLicensePlate = request.getParameter("oldLicensePlate");
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
        carRepository.updateCar(car, oldLicensePlate);
        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The car was updated successful!");
        // =================================
        String urlHistory = (String) session.getAttribute("urlHistory");
        response.sendRedirect(urlHistory);
    }
}
