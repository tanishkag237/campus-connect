package com.project.dao;

// src/com/project/dao/SocietyDAO.java


import com.project.model.Society;
import com.project.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SocietyDAO {
    public List<Society> getAllSocieties() {
        List<Society> societies = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM societies";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Society society = new Society();
                society.setSoId(rs.getInt("so_id"));
                society.setName(rs.getString("name"));
                society.setDescription(rs.getString("description"));
                society.setLogoUrl(rs.getString("logo_url"));
                societies.add(society);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return societies;
    }
}
