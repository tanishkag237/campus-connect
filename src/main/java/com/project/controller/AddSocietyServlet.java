package com.project.controller;

@WebServlet("/AddSocietyServlet")
public class AddSocietyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String logoUrl = request.getParameter("logo_url");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO societies (name, description, logo_url) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setString(3, logoUrl);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("AdminDashboardServlet");
    }
}
