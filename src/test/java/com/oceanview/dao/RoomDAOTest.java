package com.oceanview.dao;

import static org.junit.jupiter.api.Assertions.*;
import java.util.List;
import org.junit.jupiter.api.Test;
import com.oceanview.model.Room;

public class RoomDAOTest {

    @Test
    void testAddRoom() {

        RoomDAO dao = new RoomDAO();

        dao.addRoom("Test Room", 10000, "AVAILABLE");

        List<Room> rooms = dao.getAllRooms();

        assertTrue(rooms.size() > 0);
    }

    @Test
    void testGetAvailableRooms() {

        RoomDAO dao = new RoomDAO();

        List<Room> rooms = dao.getAvailableRooms();

        assertNotNull(rooms);
    }

    @Test
    void testUpdateRoomStatus() {

        RoomDAO dao = new RoomDAO();

        dao.updateRoomStatus(1, "BOOKED");

        List<Room> rooms = dao.getAllRooms();

        assertNotNull(rooms);
    }
}