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

@WebFilter(filterName = "AuthorizationParking", urlPatterns = {
        "/add-booking-office", "/delete-booking-office", "/list-booking-office", "/update-booking-office",
        "/add-car", "/delete-car", "/list-car", "/update-car",
        "/add-parking-lot", "/delete-parking-lot", "/list-parking-lot", "/update-parking-lot",
})
public class AuthorizationParking implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        EmployeeRepository repository = new EmployeeRepositoryImpl();
        HttpSession session = req.getSession();

        //check account
        Employee employeeSession = (Employee) session.getAttribute("employee");
        if (employeeSession != null && employeeSession.getDepartment().getDepartmentId() == 1
                || employeeSession.getDepartment().getDepartmentId() == 3) {
            chain.doFilter(request, response);
        }
        else {
            res.sendRedirect("error");
        }
    }
}
