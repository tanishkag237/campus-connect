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

                events.add(event);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return events;
    }

    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM events");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int eventId = rs.getInt("event_id");
                int societyId = rs.getInt("society_id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String location = rs.getString("location");
                Timestamp eventDate = rs.getTimestamp("event_date");

                Event event = new Event();
                event.setEventId(eventId);
                event.setSocietyId(societyId);
                event.setTitle(title);
                event.setDescription(description);
                event.setLocation(location);
                event.setEventDate(eventDate);

                events.add(event);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }




    public static boolean insertEvent(Event event) {
        boolean inserted = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO events (title, description, event_date,location, society_id) VALUES (?, ?, ?,?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, event.getTitle());
            ps.setString(2, event.getDescription());
            ps.setDate(3, new java.sql.Date(event.getEventDate().getTime()));
            ps.setString(4, event.getLocation());
            ps.setInt(5, event.getSocietyId());

            int rows = ps.executeUpdate();
            inserted = rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inserted;
    }

    public static Event getEventById(int id) {
        Event event = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM events WHERE event_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Event(
                        rs.getInt("event_id"),
                        rs.getInt("society_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("location"),
                        rs.getDate("event_date")  // or rs.getTimestamp("event_date") if eventDate is Timestamp
                );

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return event;
    }

    public static boolean updateEvent(Event event) {
        boolean updated = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE events SET title=?, description=?, event_date=?, location=?, society_id=? WHERE event_id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, event.getTitle());
            stmt.setString(2, event.getDescription());
           // stmt.setTimestamp(3, event.getEventDate());
            stmt.setString(4, event.getLocation());
            stmt.setInt(5, event.getSocietyId());
            stmt.setInt(6, event.getEventId());

            updated = stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }






}
