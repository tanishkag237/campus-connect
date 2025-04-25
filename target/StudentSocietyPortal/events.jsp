<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.project.model.Event" %>
<%@ page import="com.project.dao.EventDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events - College Societies</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <jsp:include page="include/header.jsp" />

    <main class="main-content">
        <section class="page-header">
            <h2>All Events</h2>
            <p>Stay updated with the latest events from all societies.</p>
        </section>

        <section class="events-section">
            <div class="events-list">
                <%
                    EventDAO dao = new EventDAO();
                    List<Event> events = dao.getAllEventsWithSocietyNames();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy HH:mm");

                    if (events != null && !events.isEmpty()) {
                        for (Event event : events) {
                %>
                <div class="event-item">
                    <div class="event-date">
                        <%= dateFormat.format(event.getEventDate()) %>
                    </div>
                    <div class="event-details">
                        <h3><%= event.getTitle() %></h3>
                        <div class="event-society">
                            <span>Organized by:</span> <%= event.getSocietyName() %>
                        </div>
                        <p><%= event.getDescription() %></p>
                        <div class="event-location">
                            <span class="location-icon">📍</span> <%= event.getLocation() %>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <p>No events found.</p>
                <%
                    }
                %>
            </div>
        </section>
    </main>

    <jsp:include page="include/footer.jsp" />
</div>
</body>
</html>
