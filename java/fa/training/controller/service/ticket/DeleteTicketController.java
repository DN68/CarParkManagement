package fa.training.controller.service.ticket;

import fa.training.repository.TicketRepository;
import fa.training.repository.impl.TicketRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteTicketController", value = "/delete-ticket")
public class DeleteTicketController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Ticket");
        session.setAttribute("link", "list-ticket");
        session.setAttribute("icon", "fa-solid fa-ticket");
        TicketRepository reponsitory= new TicketRepositoryImpl();
        int id= Integer.parseInt(request.getParameter("id"));
        reponsitory.deleteTicket(id);

        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The trip was deleted successful");
        // =================================

        String urlHistory = (String) session.getAttribute("urlHistory");
        response.sendRedirect(urlHistory);
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
