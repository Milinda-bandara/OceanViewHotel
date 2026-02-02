package com.oceanview.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.oceanview.util.DBConnection;

public class RoomDAO {

    // ================= ADD ROOM =================
    public void addRoom(String roomType, double price, String status) {

        try (Connection con = DBConnection.getConnection()) {

            String sql = "INSERT INTO rooms (room_type, price_per_night, status) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, roomType);
            ps.setDouble(2, price);
            ps.setString(3, status);

            ps.executeUpdate();

            System.out.println("Room added successfully");

        } catch (Exception e) {
            System.out.println("ERROR adding room:");
            e.printStackTrace();
        }
    }
}
