package com.project.controller;

import com.project.model.Society;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Society> societies = SocietyDAO.getAllSocieties();
        request.setAttribute("societies", societies);
        RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
        rd.forward(request, response);
    }
}

