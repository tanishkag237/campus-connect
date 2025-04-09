<%@ page import="java.util.List" %>
<%@ page import="com.project.model.Society" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin - Manage Societies</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<jsp:include page="include/header.jsp" />
<h2>Admin Dashboard - Societies</h2>

<a href="addSociety.jsp" class="btn">➕ Add New Society</a>

<table>
  <tr>
    <th>ID</th><th>Name</th><th>Description</th><th>Logo</th><th>Actions</th>
  </tr>
  <%
    List<Society> societies = (List<Society>) request.getAttribute("societies");
    if (societies != null) {
      for (Society s : societies) {
  %>
  <tr>
    <td><%= s.getId() %></td>
    <td><%= s.getName() %></td>
    <td><%= s.getDescription() %></td>
    <td><img src="<%= s.getLogoUrl() %>" width="80" /></td>
    <td>
      <a href="editSociety.jsp?id=<%= s.getId() %>">Edit</a>
    </td>
  </tr>
  <% } } %>
</table>
</body>
</html>
