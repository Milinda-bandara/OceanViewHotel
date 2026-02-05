package com.oceanview.dao;
import java.util.List;
import java.util.ArrayList;


import java.sql.*;
import com.oceanview.model.User;
import com.oceanview.util.DBConnection;
import java.util.List;
import java.util.ArrayList;
import java.sql.*;
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

    public void addUser(User user) {

        try (Connection con = DBConnection.getConnection()) {

            String sql = "INSERT INTO users (full_name, address, dob, register_date, username, password, role) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getAddress());
            ps.setDate(3, user.getDob());
            ps.setDate(4, user.getRegisterDate());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());
            ps.setString(7, user.getRole());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {

        List<User> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM users";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setAddress(rs.getString("address"));
                u.setDob(rs.getDate("dob"));
                u.setRegisterDate(rs.getDate("register_date"));
                u.setUsername(rs.getString("username"));
                u.setRole(rs.getString("role"));

                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void deleteUser(int userId) {

        try (Connection con = DBConnection.getConnection()) {

            String sql = "DELETE FROM users WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
