package com.oceanview.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.oceanview.dao.RoomDAO;

@WebServlet("/UpdateRoomStatusServlet")
public class UpdateRoomStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== UpdateRoomStatusServlet CALLED ===");

        String roomIdStr = request.getParameter("roomId");
        String status = request.getParameter("status");

        System.out.println("roomId = " + roomIdStr);
        System.out.println("status = " + status);

        int roomId = Integer.parseInt(roomIdStr);

        RoomDAO dao = new RoomDAO();
        dao.updateRoomStatus(roomId, status);

        response.sendRedirect(request.getContextPath() + "/staff/staffDashboard.jsp");
    }
}

