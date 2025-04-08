<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Society" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>All Societies</title>
  <link rel="stylesheet" href="css/styles.css"> <!-- optional CSS -->
  <style>
    .society-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    .society-card {
      width: 250px;
      border: 1px solid #ccc;
      border-radius: 8px;
      padding: 15px;
      background-color: #f9f9f9;
    }
    .society-logo img {
      width: 100%;
      height: 150px;
      object-fit: cover;
    }
    .society-card h3 {
      margin: 10px 0 5px;
    }
  </style>
</head>
<body>

<h2>College Societies</h2>

<%
  List<Society> societies = (List<Society>) request.getAttribute("societies");

  if (societies != null && !societies.isEmpty()) {
%>
<div class="society-container">
  <%
    for (Society society : societies) {
  %>
  <div class="society-card">
    <div class="society-logo">
<%--      <img src="<%= society.getLogo() != null && !society.getLogo().isEmpty() ? society.getLogo() : "images/default-logo.png" %>" alt="<%= society.getName() %> Logo">--%>
    </div>
    <h3><%= society.getName() %></h3>
    <p><%= society.getDescription() %></p>
    <a href="#">View More</a>
  </div>
  <%
    }
  %>
</div>
<%
} else {
%>
<p>No societies found.</p>
<%
  }
%>

</body>
</html>
