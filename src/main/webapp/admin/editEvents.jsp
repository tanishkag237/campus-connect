<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Event" %>
<%
  List<Event> events = (List<Event>) request.getAttribute("events");
%>
<h2>Edit Events</h2>
<% if (events != null && !events.isEmpty()) {
  for (Event event : events) {
%>
<p>
  <b><%= event.getTitle() %></b> -
  <a href="#">Edit</a>
</p>
<%  }
} else { %>
<p>No events to display.</p>
<% } %>
