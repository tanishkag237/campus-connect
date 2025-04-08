<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="header">
    <style>
        .header{
            background-color: #041538;
        }
    </style>
    <div class="logo">
        <h1><a href="../dashboard.jsp">Campus Connect </a></h1>
    </div>

    <nav class="main-nav">
        <ul>
            <li><a href="./dashboard.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/societies">Societies</a></li>
            <li><a href="./events.jsp">Events</a></li>
            <li><a href="notifications.jsp">Notifications</a></li>
            <li><a href="./login.jsp">Logout</a></li>
<%--            <li><a href="./register.jsp">Register</a></li>--%>
        </ul>
    </nav>
</header>

<style>
    .header {
        background-color: #333;
        color: white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo h1 {
        margin: 0;
        font-size: 24px;
    }

    .logo a {
        color: white;
        text-decoration: none;
    }

    .main-nav ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
        gap: 20px;
    }

    .main-nav a {
        color: white;
        text-decoration: none;
        font-weight: bold;
    }

    .main-nav a:hover {
        text-decoration: underline;
    }
</style>
