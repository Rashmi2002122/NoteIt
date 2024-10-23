package com.helper;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Customer;

public class CustomerDAO {

	public  static boolean checkCustomerPresence(Long number, String password) {
		Transaction transaction = null;
		Session session = FactoryProvider.getFactory().openSession();
		try {

			transaction = session.beginTransaction();
			String hql = "FROM Customer WHERE custNumber =" + number + " AND custPassword = " + password + " ";
			System.out.println(number);
			System.out.println(password);
			Query<Customer> query = session.createQuery(hql, Customer.class);

			boolean isValidCustomer = !query.list().isEmpty();
			transaction.commit();
			return isValidCustomer;

		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			System.out.println("xcvbnm");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return false;

	}

}
