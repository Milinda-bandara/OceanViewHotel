package com.oceanview.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Date;

public class UserTest {

    private User user;

    // Runs before each test
    @BeforeEach
    void setUp() {
        user = new User();
    }

    // ================= TEST USER ID =================
    @Test
    void testUserId() {
        user.setUserId(1);
        assertEquals(1, user.getUserId());
    }

    // ================= TEST FULL NAME =================
    @Test
    void testFullName() {
        user.setFullName("Milinda Bandara");
        assertEquals("Milinda Bandara", user.getFullName());
    }

    // ================= TEST ADDRESS =================
    @Test
    void testAddress() {
        user.setAddress("Galle, Sri Lanka");
        assertEquals("Galle, Sri Lanka", user.getAddress());
    }

    // ================= TEST DATE OF BIRTH =================
    @Test
    void testDob() {
        Date dob = Date.valueOf("2000-05-15");
        user.setDob(dob);
        assertEquals(dob, user.getDob());
    }

    // ================= TEST REGISTER DATE =================
    @Test
    void testRegisterDate() {
        Date regDate = Date.valueOf("2026-03-01");
        user.setRegisterDate(regDate);
        assertEquals(regDate, user.getRegisterDate());
    }

    // ================= TEST USERNAME =================
    @Test
    void testUsername() {
        user.setUsername("milinda");
        assertEquals("milinda", user.getUsername());
    }

    // ================= TEST PASSWORD =================
    @Test
    void testPassword() {
        user.setPassword("1234");
        assertEquals("1234", user.getPassword());
    }

    // ================= TEST ROLE =================
    @Test
    void testRole() {
        user.setRole("admin");
        assertEquals("admin", user.getRole());
    }

    // ================= TEST FULL USER OBJECT =================
    @Test
    void testFullUserData() {

        user.setUserId(10);
        user.setFullName("Nimal Perera");
        user.setAddress("Colombo");
        user.setDob(Date.valueOf("1999-10-10"));
        user.setRegisterDate(Date.valueOf("2026-03-03"));
        user.setUsername("nimal");
        user.setPassword("password123");
        user.setRole("staff");

        assertAll("Verify all user data",
                () -> assertEquals(10, user.getUserId()),
                () -> assertEquals("Nimal Perera", user.getFullName()),
                () -> assertEquals("Colombo", user.getAddress()),
                () -> assertEquals(Date.valueOf("1999-10-10"), user.getDob()),
                () -> assertEquals(Date.valueOf("2026-03-03"), user.getRegisterDate()),
                () -> assertEquals("nimal", user.getUsername()),
                () -> assertEquals("password123", user.getPassword()),
                () -> assertEquals("staff", user.getRole())
        );
    }
}