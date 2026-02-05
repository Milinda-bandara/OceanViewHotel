package com.oceanview.servlet;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String dob = request.getParameter("dob");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User user = new User();
        user.setFullName(fullName);
        user.setAddress(address);
        user.setDob(Date.valueOf(dob)); // safe if input type="date"
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);
        user.setRegisterDate(new Date(System.currentTimeMillis()));

        UserDAO dao = new UserDAO();
        dao.addUser(user);

        response.sendRedirect("admin/adminDashboard.jsp");
    }
}
