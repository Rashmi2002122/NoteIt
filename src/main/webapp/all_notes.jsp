
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes: Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar2.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes:</h1>


		<div class="row">

			<div class="col-12">

				<%
				Cookie[] cookies = request.getCookies();
				Long number = null;

				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if ("number".equals(cookie.getName())) {
					try {
						number = Long.parseLong(cookie.getValue());
					} catch (NumberFormatException e) {
						out.println("Invalid number value in cookie.");
					}
					break;
						}
					}
				}

				// Output the number
				System.out.println("Number from cookie: " + number);
				%>

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note where note_number= " + number);
				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card mt-3">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">
							<%=note.getContent()%>
						</p>
						<p>
							<b class="text-primary"><%=note.getAddedDate()%></b>
						</p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=note.getTitle()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=note.getTitle()%>"
								class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>


				<%
				}

				s.close();
				%>


			</div>

		</div>


	</div>
</body>
</html>