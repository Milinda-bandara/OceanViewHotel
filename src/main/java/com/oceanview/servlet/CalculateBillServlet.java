package com.oceanview.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import com.oceanview.dao.ReservationDAO;

@WebServlet("/CalculateBillServlet")
public class CalculateBillServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int reservationId = Integer.parseInt(request.getParameter("reservationId"));

            ReservationDAO dao = new ReservationDAO();
            ResultSet rs = dao.getReservationForBilling(reservationId);

            if (rs.next()) {

                String guestName = rs.getString("guest_name");
                String checkIn = rs.getString("check_in");
                String checkOut = rs.getString("check_out");
                double price = rs.getDouble("price_per_night");

                LocalDate inDate = LocalDate.parse(checkIn);
                LocalDate outDate = LocalDate.parse(checkOut);

                long nights = ChronoUnit.DAYS.between(inDate, outDate);
                double totalBill = nights * price;

                // 🔥 SAVE BILL TO DATABASE
                dao.updateTotalBill(reservationId, totalBill);

                request.setAttribute("reservationId", reservationId);
                request.setAttribute("guestName", guestName);
                request.setAttribute("nights", nights);
                request.setAttribute("price", price);
                request.setAttribute("totalBill", totalBill);

                request.getRequestDispatcher("/staff/bill.jsp")
                       .forward(request, response);

            } else {
                response.sendRedirect(request.getContextPath() +
                        "/staff/calculateBill.jsp?error=notfound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() +
                    "/staff/calculateBill.jsp?error=exception");
        }
    }
}
