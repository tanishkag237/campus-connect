package com.project.dao;

import com.project.model.Member;
import com.project.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

    public List<Member> getMembersBySocietyId(int soId) {
        List<Member> members = new ArrayList<>();

        String query = "SELECT u.user_id, u.full_name, sm.position " +
                "FROM society_members sm " +
                "JOIN users u ON sm.user_id = u.user_id " +
                "WHERE sm.so_id = ? AND sm.position IS NOT NULL AND sm.position <> ''";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, soId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Member member = new Member();
                    member.setUserId(rs.getInt("user_id"));
                    member.setName(rs.getString("full_name"));
                    member.setPosition(rs.getString("position"));
                    members.add(member);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return members;
    }

}
