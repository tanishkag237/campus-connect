package com.project.controller;
import com.project.dao.SocietyDAO;
import com.project.model.Society;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class SocietyListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SocietyDAO dao = new SocietyDAO();
        List<Society> societies = dao.getAllSocieties();
        request.setAttribute("societies", societies);
        RequestDispatcher dispatcher = request.getRequestDispatcher("societies.jsp");
        dispatcher.forward(request, response);

      //  System.out.println("Fetched societies: " + societies.size());

    }
}

