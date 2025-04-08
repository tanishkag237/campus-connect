package com.project.doa;

import com.project.model.Society;
import com.project.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SocietyDAO {
    public static List<Society> getAllSocieties() {
        List<Society> list = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM societies";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Society s = new Society();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setDescription(rs.getString("description"));
                s.setLogoPath(rs.getString("logo_path"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
