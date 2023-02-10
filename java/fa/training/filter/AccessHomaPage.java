package fa.training.filter;

import fa.training.repository.EmployeeRepository;
import fa.training.repository.impl.EmployeeRepositoryImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Properties;

@WebFilter(filterName = "AccessHomaPage", urlPatterns = {"/"})
public class AccessHomaPage implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        EmployeeRepository repository = new EmployeeRepositoryImpl();
        Properties properties = new Properties();
        HttpSession session = req.getSession();

        String contextPath = req.getContextPath();
        String servletPath = req.getServletPath();
        String query = req.getQueryString();
        String link = contextPath+servletPath + "?" + query;
        if(link.equalsIgnoreCase("/car-park/?null")) {
            res.sendRedirect("login");
        }
        properties.load(AccessHomaPage.class.getResourceAsStream("/dbConfig.properties"));
        String driver = properties.getProperty("driver");
    }
}
