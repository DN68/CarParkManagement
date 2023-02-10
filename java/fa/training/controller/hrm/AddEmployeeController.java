package fa.training.controller.hrm;

import fa.training.entity.Department;
import fa.training.entity.Employee;
import fa.training.repository.DepartmentRepository;
import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.DepartmentRepositoryImpl;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import fa.training.util.SHA256;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddEmployeeController", value = "/add-employee")
public class AddEmployeeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("link", "add-employee");
        session.setAttribute("pageName", "Employee");
        session.setAttribute("icon", "fa-users");

        EmployeeRepository repository = new EmployeeRepositoryImpl();
        DepartmentRepository repositoryDepartment = new DepartmentRepositoryImpl();

        Employee employee = (Employee) session.getAttribute("employee");

        List<Department> listDepartments = repositoryDepartment.getListDepartmentCustom(employee.getDepartment().getDepartmentId());
        request.setAttribute("listDepartments", listDepartments);
        request.getRequestDispatcher("./html/hrm/add-employee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        EmployeeRepository repository = new EmployeeRepositoryImpl();
        session.setAttribute("toastSuccess", false);

        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String dateOfBirth = request.getParameter("dateOfBirth");
        boolean sex = Boolean.parseBoolean(request.getParameter("sex"));
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        int departmentId = Integer.parseInt(request.getParameter("departmentId"));

        Employee employee = Employee.builder()
                .account(account)
                .address(address)
                .birthDate(dateOfBirth)
                .email(email)
                .name(fullName)
                .phone(phoneNumber)
                .password(SHA256.encrypt(password))
                .sex(sex)
                .department(Department.builder().departmentId(departmentId).build())
                .build();
        repository.addEmployee(employee);
        String urlHistory = (String) session.getAttribute("urlHistory");

        if(!urlHistory.contains("employee")) {
            urlHistory = "list-employee";
        }

        //=========== set toast ============
        session.setAttribute("toastSuccess", true);
        session.setAttribute("toastColor", "success");
        session.setAttribute("infoToast", "The employee was added successful!");
        // =================================

        response.sendRedirect(urlHistory);
    }
}
