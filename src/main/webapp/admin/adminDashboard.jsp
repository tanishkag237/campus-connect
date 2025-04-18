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
  <jsp:include page="adminHeader.jsp" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

  <main class="main-content">
    <h2>Welcome, Admin!</h2>
    <p>Manage societies and monitor recent changes to society events.</p>

    <div class="admin-actions">
      <a href="addSociety.jsp" class="btn btn-primary">➕ Add New Society</a>
<%--      <a href="#">✏️ Edit Existing Societies</a>--%>
      <a href="addEvent.jsp" class="btn btn-primary">➕ Add Event</a>
<%--      <a href="editEvents.jsp" class="btn btn-info">✏️ Edit Events</a>--%>




    </div>

  </main>

  <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>
