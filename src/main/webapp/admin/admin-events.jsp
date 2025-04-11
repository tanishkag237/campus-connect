<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Event" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin - Manage Events</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<h2>Manage Events</h2>

<!-- Add / Edit Event Form -->
<form action="admin-event" method="post">
  <input type="hidden" name="action" value="addOrEdit">
  <input type="hidden" name="event_id" value="<%= request.getAttribute("eventId") != null ? request.getAttribute("eventId") : "" %>">

  <label>Society ID:</label>
  <input type="number" name="so_id" required><br>

  <label>Title:</label>
  <input type="text" name="title" required><br>

  <label>Description:</label>
  <textarea name="description" required></textarea><br>

  <label>Location:</label>
  <input type="text" name="location" required><br>

  <label>Date & Time:</label>
  <input type="datetime-local" name="event_date" required><br>

  <button type="submit">Save Event</button>
</form>

<hr>

<!-- Event List with Delete Buttons -->
<h3>All Events</h3>
<table border="1">
  <tr>
    <th>ID</th>
    <th>Society</th>
    <th>Title</th>
    <th>Date</th>
    <th>Actions</th>
  </tr>
  <%
    List<Event> allEvents = (List<Event>) request.getAttribute("allEvents");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    if (allEvents != null) {
      for (Event event : allEvents) {
  %>
  <tr>
    <td><%= event.getEventId() %></td>
    <td><%= event.getSocietyId() %></td>
    <td><%= event.getTitle() %></td>
    <td><%= sdf.format(event.getEventDate()) %></td>
    <td>
      <form action="admin-event" method="post" style="display:inline;">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="event_id" value="<%= event.getEventId() %>">
        <button type="submit" onclick="return confirm('Delete this event?')">Delete</button>
      </form>
    </td>
  </tr>
  <%
      }
    }
  %>
</table>
</body>
</html>
