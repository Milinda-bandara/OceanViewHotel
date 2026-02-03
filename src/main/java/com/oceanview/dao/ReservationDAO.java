package com.oceanview.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.oceanview.model.Reservation;
import com.oceanview.util.DBConnection;

public class ReservationDAO {
	
	public void addReservation(String guestName, String address, String contact,
            int roomId, String checkIn, String checkOut,
            double totalBill) {

		try (Connection con = DBConnection.getConnection()) {
		
		String sql = "INSERT INTO reservations " +
		 "(guest_name, address, contact_number, room_id, check_in, check_out, total_bill) " +
		 "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, guestName);
		ps.setString(2, address);
		ps.setString(3, contact);
		ps.setInt(4, roomId);
		ps.setString(5, checkIn);
		ps.setString(6, checkOut);
		ps.setDouble(7, totalBill);
		
		ps.executeUpdate();
		
		System.out.println("Reservation added successfully");
		
		} catch (Exception e) {
		System.out.println("ERROR adding reservation");
		e.printStackTrace();
		}
		}

    public List<Reservation> getAllReservations() {

        List<Reservation> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM reservations";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Reservation r = new Reservation();

                r.setReservationId(rs.getInt("reservation_id"));
                r.setGuestName(rs.getString("guest_name"));
                r.setAddress(rs.getString("address"));
                r.setContactNumber(rs.getString("contact_number"));
                r.setRoomId(rs.getInt("room_id"));
                r.setCheckIn(rs.getString("check_in"));
                r.setCheckOut(rs.getString("check_out"));
                r.setTotalBill(rs.getDouble("total_bill"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public ResultSet getReservationForBilling(int reservationId) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql =
            "SELECT r.reservation_id, r.guest_name, r.check_in, r.check_out, " +
            "rm.price_per_night " +
            "FROM reservations r " +
            "JOIN rooms rm ON r.room_id = rm.room_id " +
            "WHERE r.reservation_id = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, reservationId);

        return ps.executeQuery();
    }
    
    public void updateTotalBill(int reservationId, double totalBill) {

        try (Connection con = DBConnection.getConnection()) {

            String sql = "UPDATE reservations SET total_bill = ? WHERE reservation_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, totalBill);
            ps.setInt(2, reservationId);

            ps.executeUpdate();

            System.out.println("Total bill updated for reservation ID " + reservationId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
