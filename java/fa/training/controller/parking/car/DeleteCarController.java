package fa.training.controller.parking.car;

import fa.training.repository.CarRepository;
import fa.training.repository.impl.CarRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteCarController", value = "/delete-car")
public class DeleteCarController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Car");
        session.setAttribute("link", "delete-car");
        session.setAttribute("icon", "fa-solid fa-car");
        CarRepository carRepository = new CarRepositoryImpl();

        String licensePlate = request.getParameter("licensePlate");
        carRepository.deleteCar(licensePlate);
        String urlHistory = (String) session.getAttribute("urlHistory");
        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The car was deleted successful!");
        // =================================
        response.sendRedirect(urlHistory);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
