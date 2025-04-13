package com.project.controller.admin;

import com.project.dao.EventDAO;
import com.project.dao.SocietyDAO;
import com.project.model.Event;
import com.project.model.Society;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class EditEventServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("id"));

            EventDAO eventDAO = new EventDAO();
            Event event = eventDAO.getEventById(eventId);

            if (event == null) {
                request.setAttribute("errorMessage", "Event not found.");
                request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
                return;
            }

            SocietyDAO societyDAO = new SocietyDAO();
            List<Society> societies = societyDAO.getAllSocieties();

            request.setAttribute("event", event);
            request.setAttribute("societies", societies);
            request.getRequestDispatcher("admin/editEvents.jsp").forward(request, response);


//            request.setAttribute("event", event);
//            request.setAttribute("societies", societies);
//
//            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/editEvents.jsp");
//            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong.");
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        int societyId = Integer.parseInt(request.getParameter("societyId"));
        Date eventDate = Date.valueOf(request.getParameter("eventDate"));

        Event event = new Event(eventId, societyId, title, description, location, eventDate);
        EventDAO dao = new EventDAO();
        boolean updated = dao.updateEvent(event);

        if (updated) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to update event.");
            request.setAttribute("event", event);

            SocietyDAO societyDAO = new SocietyDAO();
            List<Society> societies = societyDAO.getAllSocieties();
            request.setAttribute("societies", societies);

            request.getRequestDispatcher("admin/editEvents.jsp").forward(request, response);
        }
    }
}
