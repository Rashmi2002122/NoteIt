<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="authorization.css">

</head>
<body>
	<h2>
		Welcome to <span>NoteIt</span>
	</h2>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="SignIn" method="post">
				<h1>Create Account</h1>

				<span>use your email for registration</span>
				 <input type="text" placeholder="Name" name="name" /> 
				 <input type="email" name="email" placeholder="Email" />
				 <input type="number" placeholder="Number" name="phone" />
				 <input type="password" placeholder="Password" name="password" />

				<button>Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="Login" method="post">
				<h1>Login</h1>

				<span>or use your account</span> <input type="number"
					placeholder="number" name="number" /> <input type="password"
					placeholder="Password" name="password" /> <a href="#">Forgot
					your password?</a>
				<button>Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<p>Hello Friends!!</p>
	</footer>

	<script type="text/javascript">
	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');

	signUpButton.addEventListener('click', () => {
		container.classList.add("right-panel-active");
	});

	signInButton.addEventListener('click', () => {
		container.classList.remove("right-panel-active");
	});</script>

</body>
</html>