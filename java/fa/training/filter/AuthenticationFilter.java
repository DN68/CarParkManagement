package fa.training.filter;

import fa.training.entity.Employee;
import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter ", urlPatterns = {"/"})
public class AuthenticationFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        EmployeeRepository repository = new EmployeeRepositoryImpl();

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        //check account
        Employee employeeSession = (Employee) session.getAttribute("employee");
        if (employeeSession != null) {
            chain.doFilter(request, response);
        } else {
            //check cookie
            Cookie[] cookies = req.getCookies();
            String emailCookie = null;
            String passwordCookie = null;
            for (Cookie c : cookies) {
                if (c.getName().equals("email")) {
                    emailCookie = c.getValue();
                }
                if (c.getName().equals("password")) {
                    passwordCookie = c.getValue();
                }
                if (emailCookie != null && passwordCookie != null) {
                    break;
                }
            }
            if (emailCookie != null && passwordCookie != null) {
                Employee employee = repository.checkLogin(emailCookie, passwordCookie);
                if (employee != null) { // cookie hop le
                    session.setAttribute("employee", employee);
                    session.setMaxInactiveInterval(60*60*24*365);
                    chain.doFilter(request, response);
                    return;
                }
            }
            res.sendRedirect("login");
        }
    }
}
