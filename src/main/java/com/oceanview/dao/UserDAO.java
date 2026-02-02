package com.oceanview.dao;

import java.sql.*;
import com.oceanview.model.User;
import com.oceanview.util.DBConnection;

public class UserDAO {

    // ================= LOGIN =================
    public User login(String username, String password) {

        System.out.println("=== LOGIN ATTEMPT START ===");
        System.out.println("Username received : [" + username + "]");
        System.out.println("Password received : [" + password + "]");

        try (Connection con = DBConnection.getConnection()) {

            System.out.println("Database connected successfully");

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            System.out.println("Executing SQL query...");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("User FOUND in database");

                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setRole(rs.getString("role"));

                System.out.println("User role : " + u.getRole());
                System.out.println("=== LOGIN SUCCESS ===");

                return u;
            }

        } catch (Exception e) {
            System.out.println("ERROR during login:");
            e.printStackTrace();
        }

        System.out.println("=== LOGIN FAILED ===");
        return null;
    }

    // ================= ADD USER =================
    public void addUser(String username, String password, String role) {

        try (Connection con = DBConnection.getConnection()) {

            String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);

            ps.executeUpdate();

            System.out.println("New user added successfully");

        } catch (Exception e) {
            System.out.println("ERROR adding user:");
            e.printStackTrace();
        }
    }
}
