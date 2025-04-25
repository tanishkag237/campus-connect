package com.project.controller.admin;

import com.project.util.ConfigUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String storedUsername = ConfigUtil.get("ADMIN_USERNAME");
        String storedPassword = ConfigUtil.get("ADMIN_PASSWORD");

        if (username.equals(storedUsername) && password.equals(storedPassword)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", username);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid admin credentials.");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("adminLogin.jsp");
    }
}
