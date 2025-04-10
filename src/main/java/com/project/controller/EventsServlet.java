package com.project.controller;

import com.project.dao.EventDAO;
import com.project.model.Event;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EventsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventDAO eventDAO = new EventDAO();
        List<Event> events = eventDAO.getAllEventsWithSocietyNames();

        request.setAttribute("events", events);
        request.getRequestDispatcher("/events.jsp").forward(request, response);
    }
}
