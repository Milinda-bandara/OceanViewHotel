package com.oceanview.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Date;
import java.util.List;

import com.oceanview.model.User;

public class UserDAOTest {

    private UserDAO userDAO;

   
    @BeforeEach
    void setUp() {
        userDAO = new UserDAO();
    }

    // ================= TEST LOGIN SUCCESS =================
    @Test
    void testLoginSuccess() {

        // Test data (must exist in database)
        String username = "milinda";
        String password = "milinda123";

        User user = userDAO.login(username, password);

        // Check if user is returned
        assertNotNull(user, "Login should return a user");

        // Check username
        assertEquals(username, user.getUsername());
    }

    // ================= TEST LOGIN FAIL =================
    @Test
    void testLoginFail() {

        String username = "wrongUser";
        String password = "wrongPass";

        User user = userDAO.login(username, password);

        // Should return null
        assertNull(user, "Login should fail and return null");
    }

    // ================= TEST ADD USER =================
    @Test
    void testAddUser() {

        User user = new User();
        user.setFullName("Test User");
        user.setAddress("Colombo");
        user.setDob(Date.valueOf("2000-01-01"));
        user.setRegisterDate(new Date(System.currentTimeMillis()));
        user.setUsername("testuser123");
        user.setPassword("1234");
        user.setRole("staff");

        userDAO.addUser(user);

        List<User> users = userDAO.getAllUsers();

        boolean userFound = users.stream()
                .anyMatch(u -> u.getUsername().equals("testuser123"));

        assertTrue(userFound, "User should be added to database");
    }

    // ================= TEST GET ALL USERS =================
    @Test
    void testGetAllUsers() {

        List<User> users = userDAO.getAllUsers();

        assertNotNull(users, "User list should not be null");
    }

    // ================= TEST DELETE USER =================
    @Test
    void testDeleteUser() {

        // First add a user to delete
        User user = new User();
        user.setFullName("Delete User");
        user.setAddress("Galle");
        user.setDob(Date.valueOf("2001-05-10"));
        user.setRegisterDate(new Date(System.currentTimeMillis()));
        user.setUsername("deleteuser");
        user.setPassword("1234");
        user.setRole("staff");

        userDAO.addUser(user);

        List<User> users = userDAO.getAllUsers();

        int userId = users.stream()
                .filter(u -> u.getUsername().equals("deleteuser"))
                .findFirst()
                .get()
                .getUserId();

        userDAO.deleteUser(userId);

        List<User> updatedUsers = userDAO.getAllUsers();

        boolean exists = updatedUsers.stream()
                .anyMatch(u -> u.getUserId() == userId);

        assertFalse(exists, "User should be deleted");
    }

    // ================= TEST TOTAL USERS COUNT =================
    @Test
    void testGetTotalUsers() {

        int count = userDAO.getTotalUsers();

        assertTrue(count >= 0, "Total users should be zero or more");
    }
}