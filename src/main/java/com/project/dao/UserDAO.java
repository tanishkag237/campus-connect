package com.project.dao;

import com.project.DBConnection;
import com.project.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {
    public boolean registerUser(User user) {
        try {
            Connection conn = DBConnection.getConnection();
            String query = "INSERT INTO users (full_name, email, username, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword()); // NOTE: hash this in real apps!

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
