package com.project.dao;

import com.project.model.Event;
import com.project.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {

    public List<Event> getAllEventsWithSocietyNames() {
        List<Event> events = new ArrayList<>();

        String sql = "SELECT e.*, s.name AS society_name " +
                "FROM events e " +
                "JOIN societies s ON e.society_id = s.so_id " +
                "ORDER BY e.event_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Event event = new Event();
                event.setEventId(rs.getInt("event_id"));
                event.setSocietyId(rs.getInt("society_id"));
                event.setTitle(rs.getString("title"));
                event.setDescription(rs.getString("description"));
                event.setEventDate(rs.getTimestamp("event_date"));
                event.setLocation(rs.getString("location"));
                event.setSocietyName(rs.getString("society_name"));
                events.add(event);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return events;
    }

    public List<Event> getEventsBySocietyId(int soId) {
        List<Event> events = new ArrayList<>();

        String sql = "SELECT * FROM events WHERE society_id = ? ORDER BY event_date ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, soId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Event event = new Event();
                event.setEventId(rs.getInt("event_id"));
                event.setSocietyId(rs.getInt("society_id"));
                event.setTitle(rs.getString("title"));
                event.setDescription(rs.getString("description"));
                event.setEventDate(rs.getTimestamp("event_date"));
                event.setLocation(rs.getString("location"));
//                event.setCreatedAt(rs.getTimestamp("created_at"));

                events.add(event);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return events;
    }

}
