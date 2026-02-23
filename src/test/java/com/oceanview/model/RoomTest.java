package com.oceanview.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class RoomTest {

    @Test
    void testRoomObject() {

        Room room = new Room();

        room.setRoomId(5);
        room.setRoomType("Suite");
        room.setPricePerNight(25000);
        room.setStatus("AVAILABLE");

        assertEquals(5, room.getRoomId());
        assertEquals("Suite", room.getRoomType());
        assertEquals(25000, room.getPricePerNight());
        assertEquals("AVAILABLE", room.getStatus());
    }
}