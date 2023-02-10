package fa.training.controller.parking.parking_lot;

import fa.training.entity.ParkingLot;
import fa.training.entity.Search;
import fa.training.repository.ParkingLotRepository;
import fa.training.repository.impl.ParkingLotRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListParkingLotController", value = "/list-parking-lot")
public class ListParkingLotController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Parking lot");
        session.setAttribute("link", "list-parking-lot");
        session.setAttribute("icon", "fa-solid fa-location-dot");

        ParkingLotRepository repository = new ParkingLotRepositoryImpl();

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

        int size = repository.getTotalParkingLots(option, txtSearch);
        int non = 10;
        int endP = size / non;
        if (size % non != 0) endP++;

        List<ParkingLot> listParkingLots = repository.getListParkingLots(index, non, option, txtSearch);

        request.setAttribute("endP", endP);
        request.setAttribute("tag", index);
        request.setAttribute("listParkingLots", listParkingLots);
        request.setAttribute("option", option);
        request.setAttribute("txtSearch", txtSearch);

        String urlHistory = "list-parking-lot?page="+index+"&txtSearch="+txtSearch+"&option="+option;
        session.setAttribute("urlHistory", urlHistory);

        //================== show list search ==================
        ArrayList<Search> listSearch = new ArrayList<>(Arrays.asList(
                Search.builder().searchId(0).searchName("Quantity").build(),
                Search.builder().searchId(1).searchName("Name").build(),
                Search.builder().searchId(2).searchName("Place").build(),
                Search.builder().searchId(3).searchName("Price").build(),
                Search.builder().searchId(4).searchName("Status").build(),
                Search.builder().searchId(5).searchName("Area").build()
        ));
        request.setAttribute("listSearch", listSearch);
        //=============================================================
        System.out.println(listParkingLots);
        request.getRequestDispatcher("./html/parking/parking_lot/list-parking-lot.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
