package fa.training.controller.common;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LogoutController", value = "/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        Cookie[] cookies = request.getCookies();
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("email") || cooky.getName().equals("password")) {
                cooky.setMaxAge(0);
                response.addCookie(cooky);
            }
        }
        response.sendRedirect("login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
