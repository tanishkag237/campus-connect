package com.project.controller;

import com.project.dao.EventDAO;
import com.project.dao.MemberDAO;
import com.project.dao.SocietyDAO;
import com.project.model.Event;
import com.project.model.Member;
import com.project.model.Society;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/society-details")
public class SocietyDetailsServlet extends HttpServlet {

    private SocietyDAO societyDAO;
    private EventDAO eventDAO;
    private MemberDAO memberDAO;

    @Override
    public void init() throws ServletException {
        societyDAO = new SocietyDAO();
        eventDAO = new EventDAO();
        memberDAO = new MemberDAO(); // ✅ Initialize this
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String soIdParam = request.getParameter("so_id");
        if (soIdParam != null && !soIdParam.isEmpty()) {
            try {
                int soId = Integer.parseInt(soIdParam);

                Society society = societyDAO.getSocietyById(soId);
                List<Event> societyEvents = eventDAO.getEventsBySocietyId(soId);
                List<Member> members = memberDAO.getMembersBySocietyId(soId); // ✅ Add this line

                request.setAttribute("society", society);
                request.setAttribute("societyEvents", societyEvents);
                request.setAttribute("members", members); // ✅ Add this line

            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("error", "Invalid society ID.");
            }
        } else {
            request.setAttribute("error", "Society ID not provided.");
        }

        request.getRequestDispatcher("society-details.jsp").forward(request, response);
    }
}
