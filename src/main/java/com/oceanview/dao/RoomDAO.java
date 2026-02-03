package com.oceanview.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.oceanview.model.Room;


import com.oceanview.model.Reservation;
import com.oceanview.util.DBConnection;
import com.oceanview.model.Room;

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
    public List<Room> getAllRooms() {

        List<Room> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM rooms";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Room r = new Room();

                r.setRoomId(rs.getInt("room_id"));
                r.setRoomType(rs.getString("room_type"));
                r.setPricePerNight(rs.getDouble("price_per_night"));
                r.setStatus(rs.getString("status"));
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
