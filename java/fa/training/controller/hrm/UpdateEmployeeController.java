package fa.training.controller.hrm;

import fa.training.entity.Department;
import fa.training.entity.Employee;
import fa.training.repository.DepartmentRepository;
import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.DepartmentRepositoryImpl;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import fa.training.util.SHA256;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateEmployeeController", value = "/update-employee")
public class UpdateEmployeeController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("pageName", "Employee");
        session.setAttribute("icon", "fa-users");

        EmployeeRepository repository = new EmployeeRepositoryImpl();
        DepartmentRepository repositoryDepartment = new DepartmentRepositoryImpl();
        Employee employeeSession = (Employee) session.getAttribute("employee");

        int id = Integer.parseInt(request.getParameter("id"));

        Employee employee = repository.getEmployeeById(id);
        request.setAttribute("employee", employee);

        List<Department> listDepartments = repositoryDepartment.getListDepartmentCustom(employeeSession.getDepartment().getDepartmentId());
        request.setAttribute("listDepartments", listDepartments);

        boolean require = (employeeSession.getDepartment().getDepartmentId() == 1 || employeeSession.getDepartment().getDepartmentId() == 2) && (employee.getEmployeeId() != employeeSession.getEmployeeId());
        request.setAttribute("require", require);

        boolean resetPassword = (employeeSession.getDepartment().getDepartmentId() == 1) && (employee.getEmployeeId() != employeeSession.getEmployeeId());
        request.setAttribute("resetPassword", resetPassword);

        request.getRequestDispatcher("./html/hrm/update-employee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //disappear toast
        session.setAttribute("toastSuccess", false);

        EmployeeRepository repository = new EmployeeRepositoryImpl();
        DepartmentRepository repositoryDepartment = new DepartmentRepositoryImpl();
        Employee employeeSession = (Employee) session.getAttribute("employee");

        String resetPassword = request.getParameter("resetPassword");
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = repository.getEmployeeById(id);
        System.out.println(resetPassword);
        if (resetPassword != null) {
            //reset password
            repository.updatePassword(id, SHA256.encrypt("Aa12345678"));
            //=========== set toast ============
            session.setAttribute("toastSuccess", true);
            session.setAttribute("toastColor", "success");
            session.setAttribute("infoToast", "The employee was reset password successful!");
            // =================================
            response.sendRedirect("update-employee?id=" + id);
        } else {
            String fullName = request.getParameter("fullName");
            String phoneNumber = request.getParameter("phoneNumber");
            String dateOfBirth = request.getParameter("dateOfBirth");
            boolean sex = Boolean.parseBoolean(request.getParameter("sex"));
            System.out.println("Real: "+request.getParameter("sex"));
            System.out.println(sex);
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String account = request.getParameter("account");
            String password = SHA256.encrypt(request.getParameter("password"));
            int departmentId = Integer.parseInt(request.getParameter("departmentId"));
            String changePassword = request.getParameter("changePassword");
            String newPassword = request.getParameter("newPassword");
            String reNewPassword = request.getParameter("reNewPassword");
            if (password == null || password.trim() == "") password = "";
            if (newPassword == null || newPassword.trim() == "") newPassword = "";
            if (reNewPassword == null || reNewPassword.trim() == "") reNewPassword = "";
            List<Department> listDepartments = repositoryDepartment.getListDepartmentCustom(employee.getDepartment().getDepartmentId());

            Employee inputtedEmployee = Employee.builder().employeeId(id).account(account).address(address).birthDate(dateOfBirth).email(email).name(fullName).phone(phoneNumber).password(password).sex(sex).department(Department.builder().departmentId(departmentId).build()).build();
            System.out.println(inputtedEmployee);
            System.out.println(newPassword);
            System.out.println(reNewPassword);
            if (changePassword == null) {
                newPassword = employee.getPassword();
                inputtedEmployee.setPassword(newPassword);
                repository.updateEmployee(inputtedEmployee);
                //=========== set toast ============
                session.setAttribute("toastSuccess", true);
                session.setAttribute("toastColor", "success");
                session.setAttribute("infoToast", "The employee was updated successful!");
                // =================================
                String urlHistory = (String) session.getAttribute("urlHistory");
                response.sendRedirect(urlHistory);
            } else if (changePassword != null) {
                if (!password.equals(employee.getPassword())) {
                    request.setAttribute("error", "Password incorrect!");
                    request.setAttribute("employee", inputtedEmployee);
                    request.setAttribute("listDepartments", listDepartments);
                    //=========== set toast ============
                    session.setAttribute("toastSuccess", true);
                    session.setAttribute("toastColor", "danger");
                    session.setAttribute("infoToast", "Password incorrect!");
                    // =================================
                    request.getRequestDispatcher("./html/hrm/update-employee.jsp").forward(request, response);
                } else if (newPassword == null || reNewPassword == null || newPassword == "" || reNewPassword == "") {
                    request.setAttribute("error", "Please enter and re-enter new password!");
                    request.setAttribute("employee", inputtedEmployee);
                    request.setAttribute("listDepartments", listDepartments);
                    //=========== set toast ============
                    session.setAttribute("toastSuccess", true);
                    session.setAttribute("toastColor", "danger");
                    session.setAttribute("infoToast", "Please enter and re-enter new password!");
                    // =================================
                    request.getRequestDispatcher("./html/hrm/update-employee.jsp").forward(request, response);
                } else if (!reNewPassword.equals(newPassword)) {
                    request.setAttribute("error", "New password does not match!");
                    request.setAttribute("employee", inputtedEmployee);
                    request.setAttribute("listDepartments", listDepartments);
                    //=========== set toast ============
                    session.setAttribute("toastSuccess", true);
                    session.setAttribute("toastColor", "danger");
                    session.setAttribute("infoToast", "New password does not match!");
                    // =================================
                    request.getRequestDispatcher("./html/hrm/update-employee.jsp").forward(request, response);
                } else if (password.equals(employee.getPassword()) && reNewPassword.equals(newPassword) && (newPassword != null && reNewPassword != null)) {
                    inputtedEmployee.setPassword(SHA256.encrypt((newPassword)));
                    repository.updateEmployee(inputtedEmployee);
                    //=========== set toast ============
                    session.setAttribute("toastSuccess", true);
                    session.setAttribute("toastColor", "success");
                    session.setAttribute("infoToast", "The employee was updated successful!");
                    // =================================
                    String urlHistory = (String) session.getAttribute("urlHistory");
                    response.sendRedirect(urlHistory);
                }
            }
        }
    }
}
