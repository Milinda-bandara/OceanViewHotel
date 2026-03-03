package com.oceanview.servlet;

import static org.mockito.Mockito.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;

public class AddReservationServletTest {

    private AddReservationServlet servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;

    @BeforeEach
    void setUp() {
        servlet = new AddReservationServlet();

        // Create mock request and response
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
    }

    @Test
    void testDoPostAddReservation() throws Exception {

        // Mock form data
        when(request.getParameter("guestName")).thenReturn("Kasun Perera");
        when(request.getParameter("address")).thenReturn("Galle");
        when(request.getParameter("contact")).thenReturn("0771234567");
        when(request.getParameter("roomId")).thenReturn("101");
        when(request.getParameter("checkIn")).thenReturn("2026-03-10");
        when(request.getParameter("checkOut")).thenReturn("2026-03-12");
        when(request.getContextPath()).thenReturn("/OceanViewHotel");

        // Call servlet method
        servlet.doPost(request, response);

        // Verify redirect happened
        verify(response).sendRedirect("/OceanViewHotel/staff/staffDashboard.jsp");
    }
}