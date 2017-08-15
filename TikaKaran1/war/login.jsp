<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script>
	var googleUser = {};
	var startApp = function() {
		gapi
				.load(
						'auth2',
						function() {
							// Retrieve the singleton for the GoogleAuth library and set up the client.
							auth2 = gapi.auth2
									.init({
										client_id : '848464913909-5r193q2l9m5i6qjmj0hg4si5bj4cvaf9.apps.googleusercontent.com',
										cookiepolicy : 'single_host_origin',
									// Request scopes in addition to 'profile' and 'email'
									//scope: 'additional_scope'
									});
							attachSignin(document.getElementById('customBtn'));
						});
	};

	function attachSignin(element) {
		console.log(element.id);
		auth2.attachClickHandler(element, {}, function(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId());
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail());
			var first_name = profile.getGivenName();
			var last_name = profile.getFamilyName();
			var email = profile.getEmail();
			window.location.replace("gsignin?first_name=" + first_name
					+ "&last_name=" + last_name + "&email=" + email);
		}, function(error) {
			alert(JSON.stringify(error, undefined, 2));
		});
	}
</script>

<script>
							function statusChangeCallback(response) {
								console.log('statusChangeCallback');
								console.log(response);

								if (response.status === 'connected') {
									// Logged into your app and Facebook.
									testAPI();
								} else {
									// The person is not logged into your app or we are unable to tell.
									document.getElementById('status').innerHTML = 'Please log '
											+ 'into this app.';
								}
							}

							function checkLoginState() {
								FB.getLoginStatus(function(response) {
									statusChangeCallback(response);
								});
							}

							window.fbAsyncInit = function() {
								FB.init({
									appId : '877763445717604',
									cookie : true,

									xfbml : true,
									version : 'v2.8' // use graph api version 2.8
								});

							};

							// Load the SDK asynchronously
							(function(d, s, id) {
								var js, fjs = d.getElementsByTagName(s)[0];
								if (d.getElementById(id))
									return;
								js = d.createElement(s);
								js.id = id;
								js.src = "//connect.facebook.net/en_US/sdk.js";
								fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));

							// Here we run a very simple test of the Graph API after login is
							// successful.  See statusChangeCallback() for when this call is made.
							function testAPI() {
								console
										.log('Welcome!  Fetching your information.... ');
								FB
										.api(
												'/me?fields=id,name,email,permissions',
												function(response) {
													console.log(response.name);
													console.log(response.email);
													console
															.log('Successful login for: '
																	+ response.name);
													var name = response.name;
													var arr = name.split(" ");
													var firstname = arr[0];
													var lastname = arr[1];
													var email = response.email;
													window.location
															.replace("gsignin?first_name="
																	+ firstname
																	+ "&last_name="
																	+ lastname
																	+ "&email="
																	+ email);
												});
							}
						</script>

<style type="text/css">
#customBtn {
	display: inline-block;
	background: white;
	color: #444;
	width: 115px;
	border-radius: 5px;
	border: thin solid #888;
	box-shadow: 1px 1px 1px grey;
	white-space: nowrap;
}

#customBtn:hover {
	cursor: pointer;
}

span.label {
	font-family: serif;
	font-weight: normal;
}

span.icon {
	background: url('g-normal.jpg') transparent 10px no-repeat;
	background-size: 25px;
	display: inline-block;
	vertical-align: middle;
	width: 42px;
	height: 42px;
}

span.buttonText {
	display: inline-block;
	vertical-align: middle;
	padding-left: 5px;
	padding-right: 42px;
	font-size: 14px;
	font-weight: bold;
	/* Use the Roboto font that is loaded in the <head> */
	font-family: 'Roboto', sans-serif;
}
</style>
</head>
<body>
	<section id="page-title" style="background-color: #00e6e6">

		<div class="container clearfix">
			<h1>My Account</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp">Home</a></li>

				<li class="active">Login</li>
			</ol>
		</div>

	</section>
	<!-- #page-title end -->

	<!-- Content
		============================================= -->

	<section id="content">
		<div class="content-wrap">


			<div class="container clearfix">

				<div class="col_one_third nobottommargin">

					<div class="well well-lg nobottommargin">
						<form id="login-form" name="login-form" class="nobottommargin"
							action="/login" method="post">

							<h3>Login to your Account</h3>

							<div class="col_full">
								<label for="login-form-username">Username:</label> <input
									type="text" id="login-form-username" name="email" value=""
									class="form-control" />
							</div>

							<div class="col_full">
								<label for="login-form-password">Password:</label> <input
									type="password" id="login-form-password" name="pass" value=""
									class="form-control" />
							</div>
							<div class="col_full">
								<input type="checkbox" name="check" value="checked" /> Remember
								me
							</div>
							<div class="col_full nobottommargin">
								<button class="button button-3d nomargin" id="login-form-submit"
									name="login-form-submit" value="login">Login</button>
								<a href="forgot.jsp" class="fright">Forgot Password?</a>
							</div>

						</form>
						<p align="center">---OR---</p>

						<!-- In the callback, you would hide the gSignInWrapper element on a
  								successful sign in -->
						<div id="gSignInWrapper">

							<div id="customBtn" class="customGPlusSignIn">
								<span class="icon"></span> <span class="buttonText">Google</span>
							</div>
						</div>
						<div id="name"></div><br>
						<script>
							startApp();
						</script>
						
						
							<div class="fb-login-button" data-max-rows="1" data-size="medium"
								data-button-type="login_with" data-show-faces="false"
								data-auto-logout-link="false" data-use-continue-as="false"
								onlogin="checkLoginState();"></div>

							
					
					</div>

				</div>

				<div class="col_two_third col_last nobottommargin">


					<h3>Don't have an Account? Register Now.</h3>
					<br>
					<form id="register-form" name="register-form"
						class="nobottommargin" action="/signup" method="post">

						<div class="col_half">
							<label for="register-form-name">First Name:</label> <input
								type="text" id="register-form-name" name="Fname" value=""
								class="form-control" />
						</div>


						<div class="col_half col_last">
							<label for="register-form-email">Last Name:</label> <input
								type="text" id="register-form-email" name="Lname" value=""
								class="form-control" />
						</div>

						<div class="clear"></div>

						<div class="col_half ">
							<label for="register-form-email">Email Address:</label> <input
								type="email" id="register-form-email" name="email" value=""
								class="form-control" />
						</div>


						<div class="col_half col_last">
							<label for="register-form-password">Password:</label> <input
								type="password" id="register-form-password" name="pass" value=""
								class="form-control" />
						</div>

						<div class="clear"></div>


						<div class="col_half col_last">
							<label for="register-form-password">Phone Number :</label> <input
								type="number" id="register-form-password" name="phone" value=""
								class="form-control" />
						</div>
						<div class="clear"></div>



						<div class="col_full nobottommargin">
							<button class="button button-3d button-black nomargin"
								id="register-form-submit" name="register-form-submit"
								value="register">Register Now</button>
						</div>

					</form>

				</div>

			</div>

		</div>
	</section>
	<!-- #content end -->

	<!-- Footer
		============================================= -->



</body>
</html>
<%@ include file="footer.jsp"%>