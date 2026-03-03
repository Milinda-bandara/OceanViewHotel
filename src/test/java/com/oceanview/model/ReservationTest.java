package com.oceanview.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReservationTest {

    private Reservation reservation;

    // Runs before each test
    @BeforeEach
    void setUp() {
        reservation = new Reservation();
    }

    // ================= TEST SET & GET RESERVATION ID =================
    @Test
    void testReservationId() {
        reservation.setReservationId(1);
        assertEquals(1, reservation.getReservationId());
    }

    // ================= TEST GUEST NAME =================
    @Test
    void testGuestName() {
        reservation.setGuestName("John Silva");
        assertEquals("John Silva", reservation.getGuestName());
    }

    // ================= TEST ADDRESS =================
    @Test
    void testAddress() {
        reservation.setAddress("Galle, Sri Lanka");
        assertEquals("Galle, Sri Lanka", reservation.getAddress());
    }

    // ================= TEST CONTACT NUMBER =================
    @Test
    void testContactNumber() {
        reservation.setContactNumber("0771234567");
        assertEquals("0771234567", reservation.getContactNumber());
    }

    // ================= TEST ROOM ID =================
    @Test
    void testRoomId() {
        reservation.setRoomId(101);
        assertEquals(101, reservation.getRoomId());
    }

    // ================= TEST CHECK-IN DATE =================
    @Test
    void testCheckIn() {
        reservation.setCheckIn("2026-03-01");
        assertEquals("2026-03-01", reservation.getCheckIn());
    }

    // ================= TEST CHECK-OUT DATE =================
    @Test
    void testCheckOut() {
        reservation.setCheckOut("2026-03-05");
        assertEquals("2026-03-05", reservation.getCheckOut());
    }

    // ================= TEST TOTAL BILL =================
    @Test
    void testTotalBill() {
        reservation.setTotalBill(25000.50);
        assertEquals(25000.50, reservation.getTotalBill());
    }

    // ================= TEST FULL RESERVATION DATA =================
    @Test
    void testFullReservationData() {

        reservation.setReservationId(10);
        reservation.setGuestName("Kasun Perera");
        reservation.setAddress("Colombo");
        reservation.setContactNumber("0719876543");
        reservation.setRoomId(205);
        reservation.setCheckIn("2026-04-10");
        reservation.setCheckOut("2026-04-12");
        reservation.setTotalBill(15000);

        assertAll("Check all reservation details",
                () -> assertEquals(10, reservation.getReservationId()),
                () -> assertEquals("Kasun Perera", reservation.getGuestName()),
                () -> assertEquals("Colombo", reservation.getAddress()),
                () -> assertEquals("0719876543", reservation.getContactNumber()),
                () -> assertEquals(205, reservation.getRoomId()),
                () -> assertEquals("2026-04-10", reservation.getCheckIn()),
                () -> assertEquals("2026-04-12", reservation.getCheckOut()),
                () -> assertEquals(15000, reservation.getTotalBill())
        );
    }
}