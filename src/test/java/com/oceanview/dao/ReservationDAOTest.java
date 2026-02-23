package com.oceanview.dao;

import static org.junit.jupiter.api.Assertions.*;
import java.util.List;
import org.junit.jupiter.api.Test;
import com.oceanview.model.Reservation;

public class ReservationDAOTest {

    @Test
    void testAddReservation() {

        ReservationDAO dao = new ReservationDAO();

        dao.addReservation(
                "Test User",
                "Colombo",
                "0771234567",
                1,
                "2026-02-25",
                "2026-02-27",
                2000
        );

        List<Reservation> list = dao.getAllReservations();

        assertTrue(list.size() > 0);
    }

    @Test
    void testGetAllReservations() {

        ReservationDAO dao = new ReservationDAO();

        List<Reservation> reservations = dao.getAllReservations();

        assertNotNull(reservations);
    }
}