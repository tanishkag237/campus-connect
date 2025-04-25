<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.Society" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Societies</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <jsp:include page="include/header.jsp" />

    <main class="main-content">
        <h2>All Societies</h2>
        <div class="societies-grid">
            <%
                List<Society> societies = (List<Society>) request.getAttribute("societies");
                if (societies != null && !societies.isEmpty()) {
                    for (Society s : societies) {
            %>
            <div class="society-card">
                <div class="society-logo">
                    <img src="<%= s.getLogoUrl() %>" alt="<%= s.getName() %>" width="100">
                </div>
                <h3><%= s.getName() %></h3>
                <p><%= s.getDescription() %></p>
                <a href="SocietyDetailsServlet?so_id=<%= s.getSoId() %>" class="btn btn-small">View Details</a>

            </div>
            <%
                }
            } else {
            %>
            <p>No societies found.</p>
            <%
                }
            %>
        </div>
    </main>

    <jsp:include page="include/footer.jsp" />
</div>
</body>
</html>
