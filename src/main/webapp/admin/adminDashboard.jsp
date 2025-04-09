<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard - Campus Connect</title>
  <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<div class="container">
  <jsp:include page="../include/header.jsp" />

  <main class="main-content">
    <h2>Welcome, Admin!</h2>
    <p>Manage societies and monitor recent changes to society events.</p>

    <div class="admin-actions">
      <a href="addSociety.jsp" class="btn btn-primary">➕ Add New Society</a>
      <a href="">✏️ Edit Existing Societies</a>
<%--      <a href="viewEvents.jsp" class="btn btn-info">📅 View All Events</a>--%>
    </div>

    <section class="updates">
      <h3>Recent Updates</h3>
      <p>No updates yet.</p> <%-- You can fetch and display event change logs here --%>
    </section>
  </main>

  <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>
