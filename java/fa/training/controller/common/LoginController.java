package fa.training.controller.common;

import fa.training.entity.Employee;
import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import fa.training.util.SHA256;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeRepository repository = new EmployeeRepositoryImpl();
        HttpSession session = request.getSession();
        Cookie cookie[] = request.getCookies();
        String email = null, password = null;
        for (Cookie c : cookie) {
            if (c.getName().equals("email")) {
                email = c.getValue();
            }
            if (c.getName().equals("password")) {
                password = c.getValue();
            }
        }

        if (email != null && password != null) {
            Employee employee = repository.checkLogin(email, password);
            if (employee != null) {
                session.setAttribute("employee", employee);
                int departmentId = employee.getDepartment().getDepartmentId();
                if(departmentId == 2 || departmentId == 1) {
                    response.sendRedirect("list-employee");
                }
                else if(departmentId == 3 || departmentId == 1) {
                    response.sendRedirect("list-car");
                }
                else if(departmentId == 4 || departmentId == 1) {
                    response.sendRedirect("list-trip");
                }
                return;
            } else {
                request.getRequestDispatcher("html/common/login.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("html/common/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        EmployeeRepository repository = new EmployeeRepositoryImpl();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean remember = request.getParameter("remember") != null;// #null = false else true
        Employee employee = repository.checkLogin(email, SHA256.encrypt(password));
        if(employee != null) {
            if(remember) {
                Cookie emailCookie = new Cookie("email", employee.getEmail());
                emailCookie.setMaxAge(60 * 60 * 24 * 365);
                Cookie passwordCookie = new Cookie("password", employee.getPassword());
                passwordCookie.setMaxAge(60 * 60 * 24 * 365);
                response.addCookie(emailCookie);
                response.addCookie(passwordCookie);
            }
            session.setAttribute("employee", employee);
            int departmentId = employee.getDepartment().getDepartmentId();
            if(departmentId == 2 || departmentId == 1) {
                response.sendRedirect("list-employee");
            }
            else if(departmentId == 3 || departmentId == 1) {
                response.sendRedirect("list-car");
            }
            else if(departmentId == 4 || departmentId == 1) {
                response.sendRedirect("list-trip");
            }
        }
        else {
            request.setAttribute("error", "Email or password incorrect");
            request.setAttribute("email", email);
            request.getRequestDispatcher("html/common/login.jsp").forward(request, response);
        }
    }
}
