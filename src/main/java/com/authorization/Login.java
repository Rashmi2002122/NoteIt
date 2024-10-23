package com.authorization;

import java.io.IOException;

import com.helper.CustomerDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long Number = Long.parseLong(request.getParameter("number"));
		String password = request.getParameter("password");

		boolean customerPresence = CustomerDAO.checkCustomerPresence(Number, password);

		if (customerPresence) {
			Cookie cookie = new Cookie("number", String.valueOf(Number));
			cookie.setPath("/");
			response.addCookie(cookie);
			request.setAttribute("number", Number);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("add_notes.jsp");
			requestDispatcher.forward(request, response);
		} else {
			request.setAttribute("errorMessage", "Invalid email or password.");
			request.getRequestDispatcher("authorization.jsp").forward(request, response);
		}

	}

}
