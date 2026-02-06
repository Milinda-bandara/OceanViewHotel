package com.oceanview.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.dao.RoomDAO;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guestName = request.getParameter("guestName");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        double totalBill = 0.0;

        ReservationDAO reservationDAO = new ReservationDAO();
        RoomDAO roomDAO = new RoomDAO();

        // 1️⃣ Add reservation
        reservationDAO.addReservation(
            guestName, address, contact, roomId, checkIn, checkOut, totalBill
        );

        // 2️⃣ Mark room as BOOKED
        roomDAO.updateRoomStatus(roomId, "BOOKED");

        response.sendRedirect(request.getContextPath() + "/staff/staffDashboard.jsp");
    }
}

