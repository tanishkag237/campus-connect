<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer class="footer">
    <div class="footer-content">
        <div class="footer-section">
            <h3>College Societies</h3>
            <p>Your one-stop platform for all college society information and events.</p>
        </div>

        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/societies">Societies</a></li>
                <li><a href="./events.jsp">Events</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Connect With Us</h3>
            <div class="social-links">
                <a href="#" class="social-link">Facebook</a>
                <a href="#" class="social-link">Twitter</a>
                <a href="#" class="social-link">Instagram</a>
            </div><br>
            <div>

                <h3><a href="./admin/adminLogin.jsp">Admin</a> </h3>
            </div>


        </div>

    </div>

    <div class="footer-bottom">
        <p>&copy; <%= new java.util.Date().getYear() + 1900 %> Campus Connect. All rights reserved.</p>
    </div>
</footer>