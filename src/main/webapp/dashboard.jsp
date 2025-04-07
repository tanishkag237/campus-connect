<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Campus Connect</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <%@ include file="header.jsp" %>
    <main class="main-content">
        <section class="hero-section">
            <div class="hero-content">


                <h2>Welcome to Campus Connect</h2>
                <p>Your one-stop platform for all college society information and events.</p>

                <div class="hero-buttons">
                    <a href="#" class="btn btn-primary">Login</a>
                    <a href="#" class="btn btn-secondary">Register</a>
                </div>

            </div>
        </section>

        <section class="featured-section">
            <h2>Upcoming Events</h2>

            <div class="events-grid">
<%--                <%--%>
<%--                    List<Event> upcomingEvents = (List<Event>) request.getAttribute("upcomingEvents");--%>
<%--                    if (upcomingEvents != null && !upcomingEvents.isEmpty()) {--%>
<%--                        SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy HH:mm");--%>
<%--                        for (Event event : upcomingEvents) {--%>
<%--                %>--%>
                <div class="event-card">
                    <div class="event-date">
<%--                        <%= dateFormat.format(event.getEventDate()) %>--%>
                        <p>23/05/2025</p>
                    </div>
                    <h3>EVENT TITLE</h3>
                    <p>EVENT DESCRIPTION</p>
                    <div class="event-location">
                        <span class="location-icon">📍</span> Location:
                    </div>
                    <a href="#" class="btn btn-small">View Details</a>
                </div>
<%--                <%--%>
<%--                    }--%>
<%--                } else {--%>
<%--                %>--%>
                <p>No upcoming events at the moment.</p>
<%--                <%--%>
<%--                    }--%>
<%--                %>--%>
            </div>

            <div class="view-all">
                <a href="#" class="btn btn-secondary">View All Events</a>
            </div>
        </section>

        <section class="featured-section">
            <h2>Featured Societies</h2>

            <div class="societies-grid">
                <!-- This would be populated from the database -->
                <div class="society-card">
                    <div class="society-logo">
                        <img src="#" alt="Programming Club">
                    </div>
                    <h3>Programming Club</h3>
                    <p>A club for programming enthusiasts to learn, collaborate, and build projects together.</p>
                    <a href="#" class="btn btn-small">View Details</a>
                </div>

                <div class="society-card">
                    <div class="society-logo">
                        <img src="#" alt="Drama Society">
                    </div>
                    <h3>Drama Society</h3>
                    <p>For students interested in theater, acting, and performance arts.</p>
                    <a href="#" class="btn btn-small">View Details</a>
                </div>

                <div class="society-card">
                    <div class="society-logo">
                        <img src="#" alt="Debate Club">
                    </div>
                    <h3>Debate Club</h3>
                    <p>Improve your public speaking and debating skills with like-minded peers.</p>
                    <a href="#" class="btn btn-small">View Details</a>
                </div>
            </div>

            <div class="view-all">
                <a href="#" class="btn btn-secondary">View All Societies</a>
            </div>
        </section>
    </main>
    <%@ include file="footer.jsp" %>
</div>
</body>

</html>
