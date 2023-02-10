package fa.training.controller.service.trip;

import fa.training.entity.Search;
import fa.training.entity.Trip;
import fa.training.repository.TripRepository;
import fa.training.repository.impl.TripRepositoryImpl;
import fa.training.util.Time;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListTripController", value = "/list-trip")
public class ListTripController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Trip");
        session.setAttribute("link", "list-trip");
        session.setAttribute("icon", "fa-solid fa-plane");

        TripRepository repository = new TripRepositoryImpl();

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

        String date = request.getParameter("date");
        if(date == "" || date == null) date = null;
//        if(date == null) date = Time.getTimeNow();
        int size = repository.getTotalTrips(option, txtSearch, date);
        int non = 10;
        int endP = size / non;
        if (size % non != 0) endP++;

        List<Trip> listTrips = repository.getListTrips(index, non, option, txtSearch, date);

        request.setAttribute("endP", endP);
        request.setAttribute("tag", index);
        request.setAttribute("listTrips", listTrips);
        request.setAttribute("option", option);
        request.setAttribute("txtSearch", txtSearch);
        request.setAttribute("date", date);

        String urlHistory = "list-trip?page="+index+"&txtSearch="+txtSearch+"&option="+option;
        session.setAttribute("urlHistory", urlHistory);

        //================== show list search ==================
        ArrayList<Search> listSearch = new ArrayList<>(Arrays.asList(
                Search.builder().searchId(0).searchName("Destination").build(),
                Search.builder().searchId(1).searchName("Driver").build(),
                Search.builder().searchId(2).searchName("Car type").build(),
                Search.builder().searchId(3).searchName("Departure Time").build(),
                Search.builder().searchId(4).searchName("Booked ticket number").build(),
                Search.builder().searchId(5).searchName("Maximum ticket").build()
        ));
        request.setAttribute("listSearch", listSearch);
        //=============================================================

        request.getRequestDispatcher("./html/service/trip/list-trip.jsp").forward(request, response);
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
