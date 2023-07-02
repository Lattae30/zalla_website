<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Admin | Zalla</title>
    
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-rounded/css/uicons-thin-rounded.css'>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/Assets/css/styles2.css">
  </head>
  <body onload="loadAdminData()">
    <div class="container-fluid">
    	<div class="col-md-4 d-flex">
    	  <!-- START SIDEBAR -->
		    <div class="z-side-bar">
		        <header>
		          <!-- Image -->
		          <img src="/Assets/img/ZallaLogoWhite.svg" alt="">
		        </header>
		        <!-- Items Menu -->
		        <div class="z-menu">
		          <div class="z-item">
		            <a href="dashboardMaster.jsp" id="sideBtn"><i class="fi fi-tr-house-window"></i> Dashboard</a>
		          </div>
		          <div class="z-item" id="sideBtn">
		            <a class="z-sub-btn side-bar-btn">
		              <i class="fi fi-tr-box-open-full"></i> Products <i class='bx bx-chevron-down z-dropdown'></i>
		            </a>
		            <div class="z-sub-menu" id="sideBtn">
		              <a class="side-bar-btn" href="read_product.jsp" id="sideBtn"><i class="fi fi-tr-clipboard-list-check"></i> List Product</a>
		              <a class="side-bar-btn" href="add_product.jsp" id="sideBtn"><i class="fi fi-tr-layer-plus"></i> Add Product</a>
		            </div>
		          </div>
		          <div class="z-item" id="sideBtn">
		            <a class="z-sub-btn side-bar-btn">
		              <i class='bx bx-user'></i> Admin <i class='bx bx-chevron-down z-dropdown'></i>
		            </a>
		            <div class="z-sub-menu" id="sideBtn">
		              <a class="side-bar-btn" href="read_admin.jsp" id="sideBtn"><i class='bx bx-user-pin'></i> List Admin</a>
		              <a class="side-bar-btn" href="add_admin.jsp" id="sideBtn"><i class='bx bx-user-plus' ></i> Add Admin</a>
		            </div>
		          </div>
		          <div class="z-menu" style="margin-top: -1px;">
		            <div class="z-item">
		              <a href="/login.jsp"><i class='bx bx-exit'></i> Sign Out</a>
		            </div>
		        </div>
		      </div>
	    </div>
    	<!-- END SIDEBAR -->
    	</div>
    	
    	<!-- START MAIN CONTENT -->
    	<div class="col-md-10 d-content">
    		<div class="row">
    			<div class="col text-start">
	                <p class="pro_tb">Add Admin</p><br>
	            </div>
    		</div>
	    	<div class="row">
		      <form>
		         <div class="row g-3 mb-3">
		           <div class="col-md-8">
		             <label for="userId">Admin ID</label>
		             <input type="text" class="form-control mt-2" id="userId" placeholder="Admin ID" readonly>
		           </div>
		          </div>
		          <div class="col-md-8">
		            <label for="name">Name</label>
		            <input type="text" class="form-control mt-2" id="name" placeholder="Admin Name" required>
		          </div>
		        </div>
		        <div class="row g-3 mb-3">
		          <div class="col-md-8">
		            <label for="email">Email</label>
		            <input type="text" class="form-control mt-2" id="email" placeholder="Email" required>
		          </div>
		        </div>
		        <div class="row g-3 mb-3">
		          <div class="col-md-8">
		            <label for="password">Password</label>
		            <input type="text" class="form-control mt-2" id="password" placeholder="Admin Password" required>
		          </div>
		        </div>
		        <div class="d-grid gap-2 d-md-flex justify-content-md-end but col-md-8">
				  <button class="btn btn-outline-danger me-md-2" type="button" onclick="cancel()">Cancel</button>
		          <button type="button" class="btn btn-addPro" onclick="update_admin()">Update Admin</button>
				</div>
		      </form>
		    </div>
	    </div>
	    <!--END ADD ADMIN -->
	 </div>
	    
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
 
    <!-- JQuery CDN LINK-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <!-- Script.js -->
    <script src="/Assets/js/script.js"></script>
	
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

          //Function Load Admin
          function loadAdminData(){
        	  // Get the ID from the query parameter
              const urlParams = new URLSearchParams(window.location.search);
              const id = urlParams.get('id');
              
              if (id) {
                  // Retrieve the product data from the Firebase Realtime Database
                  firebase.database().ref('users/' + id).once('value').then(function(snapshot) {
                      const userData = snapshot.val();

                      // Update the form fields with the product data
                      document.getElementById('userId').value = userData.userId;
                      document.getElementById('name').value = userData.name;
                      document.getElementById('email').value = userData.email;
                      document.getElementById('password').value = userData.password;
                  });
              }
          }
          
		  //Initialize variable
			const auth = firebase.auth();
			const database = firebase.database();
		
			//Sign Up function
			function update_admin(){
				// Get input value
				userId = document.getElementById('userId').value;
				name = document.getElementById('name').value;
				email = document.getElementById('email').value;
				password = document.getElementById('password').value;
				
				//validate input field
				if(validate_field(name) == false || validate_field(email) == false || validate_field(password) == false){
					alert('Please input the field!');
					return;
				}
				if(validate_email(email) ==  false){
					alert('Please input your email correctly!');
					return;
				}
				
				if(validate_password(password) == false){
					alert('The password must be at least 6 characters');
					return;
				}
				
				
				//Auth
				auth.createUserWithEmailAndPassword(email, password)
				.then(function(){
					var user = auth.currentUser;
					
					var database_ref = database.ref();
					
					//Create user data
					var user_data = {
							userId : userId,
							name : name,
							email : email,
							password : password
					}
					
					//Update data dalam firebase dengan data baru
					var updates = {};
					updates['/users/' + userId] = user_data;
					firebase.database().ref().update(updates);
					
					//Success alert
					alert('Admin data successfully updated!');
					
					//Load to list admin page
					read_admin();
				})
				.catch(function(error){
					//Firebase error message
					var error_code = error.code;
					var error_message = error.message;
					
					alert(error_message);
				});
			}
			
			
			//Validate email
			function validate_email(email){
				expression = /^[^@]+@\w+(\.\w+)+\w$/;
				
				if(expression.test(email) == true){
					//Email is correct
					return true;
				} else{
					//Email is not correct
					return false;
				}
			}
			
			//Validate Password
			function validate_password(password){
				//Min 6 characters for password
				if(password < 6){
					return false;
				} else{
					return true;
				}
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
			function read_admin(){
		    	  location.href = "read_admin.jsp";
		      }
		      
		    function cancel(){
			      location.href = "read_admin.jsp";
			}
    </script>
    
  </body>
</html>