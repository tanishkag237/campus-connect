package com.project.controller;

import com.project.dao.EventDAO;
import com.project.dao.SocietyDAO;
import com.project.model.Event;
import com.project.model.Society;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class HomepageServlet extends HttpServlet {
    private EventDAO eventDAO;
    private SocietyDAO societyDAO;

    @Override
    public void init() {
        eventDAO = new EventDAO();
        societyDAO = new SocietyDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Event> upcomingEvents = eventDAO.getAllEventsWithSocietyNames();

        List<Society> societies = societyDAO.getAllSocieties();

        System.out.println("Fetched events: " + upcomingEvents.size());
        for (Event e : upcomingEvents) {
            System.out.println(e.getTitle() + " on " + e.getEventDate() + " by " + e.getSocietyName());
        }

        request.setAttribute("upcomingEvents", upcomingEvents);
        request.setAttribute("societies", societies);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

}
