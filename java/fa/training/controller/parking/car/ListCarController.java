package fa.training.controller.parking.car;

import fa.training.entity.Car;
import fa.training.entity.Search;
import fa.training.repository.CarRepository;
import fa.training.repository.impl.CarRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListCarController", value = "/list-car")
public class ListCarController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Car");
        session.setAttribute("link", "list-car");
        session.setAttribute("icon", "fa-solid fa-car");

        CarRepository repository = new CarRepositoryImpl();

        String StringIndex = request.getParameter("page");
        if (StringIndex == null) {
            StringIndex = "1";
        }

        int index = Integer.parseInt(StringIndex);
        String txtSearch = request.getParameter("txtSearch");
        if(txtSearch == null) txtSearch = "";

        int option;
        String optionStr = request.getParameter("option");
        if(optionStr == null) {
            option = 0;
        }
        else option = Integer.parseInt(request.getParameter("option"));

        int size = repository.getTotalCar(option, txtSearch);
        int non = 10;
        int endP = size / non;
        if (size % non != 0) endP++;

        List<Car> listCars = repository.getListCar(index,non,option,txtSearch);

        request.setAttribute("endP", endP);
        request.setAttribute("tag", index);
        request.setAttribute("listCars", listCars);
        request.setAttribute("option", option);
        request.setAttribute("txtSearch", txtSearch);

        String urlHistory = "list-car?page="+index+"&txtSearch="+txtSearch+"&option="+option;
        session.setAttribute("urlHistory", urlHistory);

        //================== show list search ==================
        ArrayList<Search> listSearch = new ArrayList<>(Arrays.asList(
                Search.builder().searchId(0).searchName("License Plate").build(),
                Search.builder().searchId(1).searchName("Car Type").build(),
                Search.builder().searchId(2).searchName("Car Color").build(),
                Search.builder().searchId(3).searchName("Company").build(),
                Search.builder().searchId(4).searchName("Parking Lot").build()
        ));
        request.setAttribute("listSearch", listSearch);
        //=============================================================

        request.getRequestDispatcher("./html/parking/car/list-car.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
