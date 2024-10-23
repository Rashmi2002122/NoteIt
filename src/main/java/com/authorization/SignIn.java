package com.authorization;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Customer;
import com.helper.FactoryProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Long number = Long.parseLong(request.getParameter("phone"));
		String password = request.getParameter("password");

		System.out.println(name);
		System.out.println(email);
		System.out.println(number);
		System.out.println(password);
		Customer Customer = new Customer(number, name, password, email);
		Session sr = FactoryProvider.getFactory().openSession();
		Transaction tx = sr.beginTransaction();
		sr.save(Customer);
		tx.commit();
		sr.close();
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("authorization.jsp");
		requestDispatcher.forward(request, response);

	}

}
