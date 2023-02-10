package fa.training.controller.hrm;

import fa.training.entity.Employee;
import fa.training.entity.Search;
import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ListEmployeeController", value = "/list-employee")
public class ListEmployeeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Employee");
        session.setAttribute("link", "list-employee");
        session.setAttribute("icon", "fa-users");

        EmployeeRepository repository = new EmployeeRepositoryImpl();

        Employee employee = (Employee) session.getAttribute("employee");

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

        int size = repository.getTotalEmployees(option, txtSearch,  employee.getDepartment().getDepartmentId());
        int non = 10;
        int endP = size / non;
        if (size % non != 0) endP++;

        List<Employee> listEmployees = repository.getListEmployees(index, non, option,
                txtSearch, employee.getDepartment().getDepartmentId());

        request.setAttribute("endP", endP);
        request.setAttribute("tag", index);
        request.setAttribute("listEmployees", listEmployees);
        request.setAttribute("option", option);
        request.setAttribute("txtSearch", txtSearch);

        String urlHistory = "list-employee?page="+index+"&txtSearch="+txtSearch+"&option="+option;
        session.setAttribute("urlHistory", urlHistory);

        //================== show list search ==================
        ArrayList<Search> listSearch = new ArrayList<>(Arrays.asList(
                Search.builder().searchId(0).searchName("Account").build(),
                Search.builder().searchId(1).searchName("Address").build(),
                Search.builder().searchId(2).searchName("Email").build(),
                Search.builder().searchId(3).searchName("Name").build(),
                Search.builder().searchId(4).searchName("Phone").build(),
                Search.builder().searchId(5).searchName("Department").build(),
                Search.builder().searchId(6).searchName("Date of Birth").build()
        ));
        request.setAttribute("listSearch", listSearch);
        //=============================================================

        request.getRequestDispatcher("./html/hrm/list-employee.jsp").forward(request, response);
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
