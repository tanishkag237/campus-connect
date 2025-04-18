<%@ page import="java.util.*, com.project.model.Event" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Events</title>
  <!-- Add your CSS here for styling -->
</head>
<body>
<h2>Edit Events</h2>
<table border="1">
  <thead>
  <tr>
    <th>Event Title</th>
    <th>Event Description</th>
    <th>Event Date</th>
    <th>Location</th>
    <th>Action</th>
  </tr>
  </thead>
  <tbody>
  <%
    List<Event> events = (List<Event>) request.getAttribute("events");
    for (Event event : events) {
  %>
  <tr>
    <td><%= event.getTitle() %></td>
    <td><%= event.getDescription() %></td>
    <td><%= event.getEventDate() %></td>
    <td><%= event.getLocation() %></td>
    <td><a href="editEventDetails.jsp?eventId=<%= event.getEventId() %>" class="btn btn-info">✏️ Edit</a></td>
  </tr>
  <% } %>
  </tbody>
</table>
</body>
</html>
