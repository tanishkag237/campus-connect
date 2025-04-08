package com.project;


import com.project.doa.SocietyDAO;
import com.project.model.Society;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class SocietiesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Society> societies = SocietyDAO.getAllSocieties();

        request.setAttribute("societies", societies);
        RequestDispatcher dispatcher = request.getRequestDispatcher("societies.jsp");
        dispatcher.forward(request, response);
    }
}
