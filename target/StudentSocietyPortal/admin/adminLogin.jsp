<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f2f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .back-button {
      position: absolute;
      top: 20px;
      left: 20px;
      padding: 10px 15px;
      background-color: #6c757d;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-size: 16px;
    }
    .back-button:hover {
      background-color: #5a6268;
    }
    .login-container {
      background: #fff;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    h2 {
      margin-bottom: 20px;
      text-align: center;
      color: #333;
    }
    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 12px;
      margin: 8px 0 16px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
    }
    button {
      width: 100%;
      padding: 12px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-size: 16px;
    }
    button:hover {
      background-color: #0056b3;
    }
    .error {
      color: red;
      text-align: center;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<!-- Back button positioned in the top-left corner -->
<form action="../home" method="get">
  <button type="submit" class="back-button">Back to Dashboard</button>
</form>

<div class="login-container">
  <h2>Admin Login</h2>
  <% String error = (String) request.getAttribute("errorMessage"); %>
  <% if (error != null) { %>
  <div class="error"><%= error %></div>
  <% } %>

  <form action="AdminLoginServlet" method="post">
    <input type="text" name="username" placeholder="Admin Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
  </form>
</div>
</body>
</html>
