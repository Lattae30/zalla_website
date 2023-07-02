<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="">
  <!-- Bootstrap Connection -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- Icon -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <!-- CSS Connection -->
  <link rel="stylesheet" href="Assets/css/style.css">
  <!-- Page Title -->
  <title>Sign In | Zalla</title>
</head>
<body>
  <!-- Login Main Container -->
  <div class="container-fluid d-flex min-vh-100">

    <!-- Login Image + Wellcome to Zalla -->
    <div class="col-md-6 d-flex">
      <div class="justify-content-left align-items-left circle">
        <div class="d-flex align-items-center justify-content-center" >
          <img src="Assets/img/ZallaLoginImage.svg" alt="">
        </div>
      </div>
      <div class="wellcome">
        <h2>Wellcome to <br>Zalla</h2>
        <h6>This is the place where you can find your style and inspiration.</h6>
      </div>
    </div>

    <!-- Login Form -->
    <div class="col-md-6 d-flex justify-content-center align-items-center">
        <form>
          <div class="text-center">
            <h2>Sign In</h2>
            <h6>Please Sign In to Your Account.</h6>
          </div>
          <!-- Email -->
          <div class="input-control my-4">
            <label for="uname" class="form-label"><small><i class='bx bx-user' ></i> Email Address</small></label>
            <input type="text" class="form-control form-control-lg bg-light fs-6 rounded-pill" placeholder="Email Address" id="email" name="email" required>
          </div>
          <!-- Password -->
          <div class="input-control my-4">
            <label for="uname" class="form-label"><small><i class='bx bx-lock-alt' ></i> Password</small></label>
            <input type="password" class="form-control form-control-lg bg-light fs-6 rounded-pill" placeholder="Password" id="password" name="password" required>
          </div>
          <!-- Button Submit -->
          <div class="input-control my-5">
            <input type="button" value="Sign In" onclick="signIn();" class="  form-control button-sign-in fs-6 rounded-pill ">
          </div>
        </form>

    </div>
  </div>

  	<!-- Bootstrap JS Connection -->
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	
	
	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-app.js"></script>
	
	<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-auth.js"></script>
	
	<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
	database.js"></script>
	
	<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
	firestore.js"></script>
	
	<!-- TODO: Add SDKs for Firebase products that you want to use
	https://firebase.google.com/docs/web/setup#available-libraries -->
	
	<script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
	analytics.js"></script>
	
	<script>
		const firebaseConfig = {
				apiKey: "AIzaSyAhiBfJUsoeLCNXWEpI2i03OOkufY_I0IQ",
			    authDomain: "zalla-a764b.firebaseapp.com",
			    databaseURL: "https://zalla-a764b-default-rtdb.firebaseio.com",
			    projectId: "zalla-a764b",
			    storageBucket: "zalla-a764b.appspot.com",
			    messagingSenderId: "89911317738",
			    appId: "1:89911317738:web:9c1f2c491d1d7f5a317393",
			    measurementId: "G-2G34TW17LH"
			};
		
		  // Initialize Firebase
		  firebase.initializeApp(firebaseConfig);
		  firebase.analytics();
		  
			//Initialize variable
			const auth = firebase.auth();
			const database = firebase.database();
			
		  function signIn(){
			  //Get all user input
			  email = document.getElementById('email').value;
			  password = document.getElementById('password').value;
			  
			  
			//validate input field
			if(validate_field(email) == false || validate_field(password) == false){
				alert('Please input the field!');
				return;
			}
			
			if(email == "minMaster@zallastaff.ac.id" && password == "masterAdmin"){
				//Success alert
				alert('Logged in!');
				dashboardMaster();
			}
			
				//Auth
				auth.signInWithEmailAndPassword(email, password)
				.then((userCredential) => {
					var user = userCredential.user;
					
					var database_ref = database.ref();
					
					//Create user data
					var user_data = {
							last_login : Date.now()
					}
					
					//Push to firebase database
					database_ref.child('users/' + user.uid).update(user_data);
					
					//Success alert
					alert('Logged in!');
					
					//Load to dashboard page
					dashboardPage();
				})
				.catch(function(error){
					//Firebase error message
					var error_code = error.code;
					var error_message = error.message;
					
					alert(error_message);
				});
		  }
		  
		  //Check if there's empty input field
		  function validate_field(field){
			if(field == null){
					return false;
			}
				
			if(field.length <= 0){
				return false;
			} else{
				return true;
				}
			}
		  
		  function dashboardPage(){
				location.href = "dashboard.jsp";
			}
		  
		  function dashboardMaster(){
			  location.href = "master/dashboardMaster.jsp"
		  }
	</script>
</body>
</html>