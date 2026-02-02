package com.oceanview.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.oceanview.dao.RoomDAO;

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form data
        String roomType = request.getParameter("roomType");
        String priceStr = request.getParameter("price");
        String status = request.getParameter("status");

        // Basic validation
        if (roomType == null || priceStr == null || status == null ||
            roomType.isEmpty() || priceStr.isEmpty() || status.isEmpty()) {

            response.sendRedirect("addRoom.jsp?error=1");
            return;
        }

        double price = Double.parseDouble(priceStr);

        // DAO call
        RoomDAO dao = new RoomDAO();
        dao.addRoom(roomType, price, status);

        // Redirect to admin dashboard
        response.sendRedirect("admin/adminDashboard.jsp");
    }
}
