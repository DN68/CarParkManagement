package fa.training.filter;

import fa.training.entity.Employee;
import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuhorizaionAll", urlPatterns = {"/update-employee"})
public class AuhorizaionAll implements Filter {
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

        String servletPath = req.getServletPath();
        String query = req.getQueryString();
        String link = String.valueOf(servletPath + "?" + query).substring(1).trim();
//        System.out.println("Link authen: " + link);

        String urlHistory = (String) session.getAttribute("urlHistory");
//        System.out.println(urlHistory);

        Employee employeeSession = (Employee) session.getAttribute("employee");
        if (employeeSession != null) {
            if (employeeSession.getDepartment().getDepartmentId() == 3 ||
                    employeeSession.getDepartment().getDepartmentId() == 4) {
//                System.out.println("Link1: " + "update-employee?id=" + employeeSession.getEmployeeId());
                if (link.contains("update-employee")) {
                    if (link.equals("update-employee?id=" + employeeSession.getEmployeeId())) {
//                        System.out.println("Link2: " + "update-employee?id=" + employeeSession.getEmployeeId());
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect("error");
                    }
                } else chain.doFilter(request, response);
            }
            else chain.doFilter(request, response);
        } else {
            res.sendRedirect("error");
        }
    }
}
