package fa.training.controller.hrm;

import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteEmployeeController", value = "/delete-employee")
public class DeleteEmployeeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Employee");
        session.setAttribute("icon", "fa-users");

        EmployeeRepository repository = new EmployeeRepositoryImpl();
        int id = Integer.parseInt(request.getParameter("id"));
        repository.deleteEmployee(id);
        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The employee was deleted successful!");
        // =================================
        String urlHistory = (String) session.getAttribute("urlHistory");
        response.sendRedirect(urlHistory);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
