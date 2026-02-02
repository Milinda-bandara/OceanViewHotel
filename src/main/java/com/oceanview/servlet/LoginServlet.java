package com.oceanview.servlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;

public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	String u = req.getParameter("username");
	String p = req.getParameter("password");
	User user = new UserDAO().login(u, p);
	
	if (user != null) {
	HttpSession session = req.getSession();
	session.setAttribute("user", user);
	
	if ("ADMIN".equals(user.getRole()))
	resp.sendRedirect("admin/adminDashboard.jsp");
	
	else
	resp.sendRedirect("staff/staffDashboard.jsp");
	
	} else {
	resp.sendRedirect("login.jsp?error=1");
	}
}
}