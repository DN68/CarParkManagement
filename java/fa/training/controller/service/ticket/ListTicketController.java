package fa.training.controller.service.ticket;

import fa.training.entity.Search;
import fa.training.entity.Ticket;
import fa.training.repository.TicketRepository;
import fa.training.repository.impl.TicketRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListTicketController", value = "/list-ticket")
public class ListTicketController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Ticket");
        session.setAttribute("link", "list-ticket");
        session.setAttribute("icon", "fa-solid fa-ticket");
        TicketRepository reponsitory= new TicketRepositoryImpl();
        String StringIndex = request.getParameter("page");
        if (StringIndex == null) {
            StringIndex = "1";
        }

        int index = Integer.parseInt(StringIndex);
        String txtSearch = request.getParameter("txtSearch");
        if(txtSearch == null){
            txtSearch = "";
        }

        int option;
        String optionStr = request.getParameter("option");
        if(optionStr == null) {
            option = 0;
        }
        else option = Integer.parseInt(request.getParameter("option"));

        String date = request.getParameter("date");
        int size= reponsitory.getAllTicketTotal(option,txtSearch);
        int non = 10;
        int endP = size / non;
        if (size % non != 0) endP++;

        List<Ticket> listTickets = reponsitory.getListTicket(index,non,option,txtSearch);

        request.setAttribute("endP",endP);
        request.setAttribute("tag",index);
        request.setAttribute("listTicket",listTickets);
        request.setAttribute("option",option);
        request.setAttribute("txtSearch",txtSearch);
        request.setAttribute("date",date);

        String urlHistory = "list-ticket?page="+index+"&txtSearch="+txtSearch+"&option="+option;
        session.setAttribute("urlHistory", urlHistory);
        //================== show list search ==================
        ArrayList<Search> listSearch = new ArrayList<>(Arrays.asList(
                Search.builder().searchId(0).searchName("Customer Name").build(),
                Search.builder().searchId(1).searchName("Trip").build(),
                Search.builder().searchId(2).searchName("License_Plate").build(),
                Search.builder().searchId(3).searchName("Booking time").build()
        ));
        request.setAttribute("listSearch", listSearch);
        request.getRequestDispatcher("./html/service/ticket/list-ticket.jsp").forward(request, response);
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
