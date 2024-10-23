
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar2.jsp"%>
		<br>

		<h1>Please fill your note detail</h1>
		<br>
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


		<form action="SaveNoteServlet" method="post">

			<div class="form-group">
				<label for="title">Note title</label> <input name="title" required
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here" />

			</div>


			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;"></textarea>


			</div>
			<input type="hidden" name="number" value="<%=number%>">

			<div class="container text-center">

				<button type="submit" class="btn btn-primary">Add</button>
			</div>

		</form>

	</div>


</body>
</html>