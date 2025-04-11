package com.project.controller;

import com.project.dao.EventDAO;
import com.project.model.Event;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/admin-event")
public class EventAdminServlet extends HttpServlet {

    private EventDAO eventDAO;

    @Override
    public void init() {
        eventDAO = new EventDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if ("addOrEdit".equals(action)) {
                int societyId = Integer.parseInt(request.getParameter("so_id"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String location = request.getParameter("location");
                String eventDateStr = request.getParameter("event_date");
                Date eventDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(eventDateStr);

                String eventIdParam = request.getParameter("event_id");

                if (eventIdParam != null && !eventIdParam.isEmpty()) {
                    // Edit
                    int eventId = Integer.parseInt(eventIdParam);
                    Event event = new Event(eventId, societyId, title, description, location, eventDate);
                    eventDAO.updateEvent(event);
                } else {
                    // Add new
                    Event event = new Event(0, societyId, title, description, location, eventDate);
                    eventDAO.addEvent(event);
                }

            } else if ("delete".equals(action)) {
                int eventId = Integer.parseInt(request.getParameter("event_id"));
                eventDAO.deleteEvent(eventId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to admin event page
        List<Event> allEvents = eventDAO.getAllEvents();
        request.setAttribute("allEvents", allEvents);
        request.getRequestDispatcher("/admin/admin-events.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Event> allEvents = eventDAO.getAllEvents();
        request.setAttribute("allEvents", allEvents);
        request.getRequestDispatcher("/admin/admin-events.jsp").forward(request, response);
    }
}
