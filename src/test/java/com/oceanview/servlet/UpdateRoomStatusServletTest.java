package com.oceanview.servlet;

import static org.mockito.Mockito.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UpdateRoomStatusServletTest {

    private UpdateRoomStatusServlet servlet;
    private HttpServletRequest request;
    private HttpServletResponse response;

    @BeforeEach
    void setUp() {
        servlet = new UpdateRoomStatusServlet();

        // Create mock objects
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
    }

    // ================= TEST UPDATE ROOM STATUS =================
    @Test
    void testUpdateRoomStatus() throws Exception {

        // Mock form values
        when(request.getParameter("roomId")).thenReturn("101");
        when(request.getParameter("status")).thenReturn("AVAILABLE");
        when(request.getContextPath()).thenReturn("/OceanViewHotel");

        // Call servlet method
        servlet.doPost(request, response);

        // Verify redirect to dashboard
        verify(response).sendRedirect("/OceanViewHotel/staff/staffDashboard.jsp");
    }
}