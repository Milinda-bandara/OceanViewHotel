package com.oceanview.servlet;

import static org.mockito.Mockito.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;

public class LoginServletTest {

    @Test
    void testLoginRedirect() throws Exception {

        LoginServlet servlet = new LoginServlet();

        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);

        when(request.getParameter("username")).thenReturn("admin");
        when(request.getParameter("password")).thenReturn("admin123");
        when(request.getSession()).thenReturn(session);

        servlet.doPost(request, response);

        verify(response).sendRedirect(anyString());
    }
}