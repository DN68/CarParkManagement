package fa.training.filter;

import fa.training.entity.Employee;
import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuthorizationHrm", urlPatterns = {"/add-employee", "/delete-employee",
        "/list-employee"})
public class AuthorizationHrm implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        EmployeeRepository repository = new EmployeeRepositoryImpl();

        String servletPath = req.getServletPath();
        String query = req.getQueryString();
        String link = String.valueOf(servletPath+"?"+query).substring(1);

        HttpSession session = req.getSession();
        //check account
        Employee employeeSession = (Employee) session.getAttribute("employee");
        if (employeeSession != null && employeeSession.getDepartment().getDepartmentId() == 1
                || employeeSession.getDepartment().getDepartmentId() == 2) {
            chain.doFilter(request, response);
        }
        else {
            res.sendRedirect("error");
        }
    }
}
