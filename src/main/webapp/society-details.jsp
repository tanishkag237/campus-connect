<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.Society" %>
<%@ page import="com.project.model.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Society Details - College Societies</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
  <jsp:include page="./include/header.jsp" />

  <main class="main-content">
    <%
      Society society = (Society) request.getAttribute("society");
      if (society != null) {
    %>
    <section class="society-header">
      <div class="society-banner">
        <img src="<%= society.getLogoUrl() != null ? society.getLogoUrl() : "images/default-society.jpg" %>" alt="<%= society.getName() %>">
      </div>
      <h2><%= society.getName() %></h2>
    </section>

    <section class="society-details">
      <div class="society-description">
        <h3>About</h3>
        <p><%= society.getDescription() %></p>
      </div>

      <div class="society-members">
        <h3>Members</h3>
        <!-- This would be populated from the database -->
        <div class="members-list">
          <div class="member-card">
            <div class="member-avatar">
              <img src="images/default-avatar.jpg" alt="Member">
            </div>
            <div class="member-info">
              <h4>John Doe</h4>
              <p>President</p>
            </div>
          </div>

          <div class="member-card">
            <div class="member-avatar">
              <img src="images/default-avatar.jpg" alt="Member">
            </div>
            <div class="member-info">
              <h4>Jane Smith</h4>
              <p>Vice President</p>
            </div>
          </div>

          <div class="member-card">
            <div class="member-avatar">
              <img src="images/default-avatar.jpg" alt="Member">
            </div>
            <div class="member-info">
              <h4>Mike Johnson</h4>
              <p>Secretary</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="society-events">
      <h3>Upcoming Events</h3>

      <%
        List<Event> societyEvents = (List<Event>) request.getAttribute("societyEvents");
        if (societyEvents != null && !societyEvents.isEmpty()) {
          SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy HH:mm");
      %>
      <div class="events-list">
        <%
          for (Event event : societyEvents) {
        %>
        <div class="event-item">
          <div class="event-date">
            <%= dateFormat.format(event.getEventDate()) %>
          </div>
          <div class="event-details">
            <h4><%= event.getTitle() %></h4>
            <p><%= event.getDescription() %></p>
            <div class="event-location">
              <span class="location-icon">📍</span> <%= event.getLocation() %>
            </div>
          </div>
        </div>
        <%
          }
        %>
      </div>
      <%
      } else {
      %>
      <p>No upcoming events for this society.</p>
      <%
        }
      %>
    </section>
    <%
    } else {
    %>
    <section class="error-section">
      <h2>Society Not Found</h2>
      <p>The society you are looking for does not exist or has been removed.</p>
      <a href="societies" class="btn btn-primary">View All Societies</a>
    </section>
    <%
      }
    %>
  </main>

  <jsp:include page="./include/footer.jsp" />
</div>
</body>
</html>