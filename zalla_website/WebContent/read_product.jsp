<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Products | Zalla</title>
    
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-rounded/css/uicons-thin-rounded.css'>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="Assets/css/styles2.css">
  </head>
  <body onload="getdata()">
    <div class="container-fluid">
    	<div class="col-md-4 d-flex">
    	  <!-- START SIDEBAR -->
	      <div class="z-side-bar">
		        <header>
		          <!-- Image -->
		          <img src="Assets/img/ZallaLogoWhite.svg" alt="">
		        </header>
		        <!-- Items Menu -->
		        <div class="z-menu">
		          <div class="z-item">
		            <a href="#" id="sideBtn"><i class="fi fi-tr-house-window"></i> Dashboard</a>
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
		          <div class="z-menu" style="margin-top: -1px;">
		            <div class="z-item">
		              <a href="login.jsp"><i class='bx bx-exit'></i> Sign Out</a>
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
	                <p class="pro_tb">Product Information Table</p>
	            </div>
	            <div class="col text-end">
	                <button class="btn btn-readPro" onclick="addProduct()">+ Add Product</button>
	            </div>
	        </div>
	        <div class="card card-read mt-3">
	            <div class="card-body">
	        <!-- TABLE START -->
	                <table class="table table-hover table-responsive text-center" id="tb_product">
	                    <tr class="table-head">
	                        <td>ID</td>
	                        <td>Image</td>
	                        <td>Name</td>
	                        <td>Category</td>
	                        <td>Size</td>
	                        <td>Price</td>
	                        <td>Quantity</td>
	                        <td>Actions</td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	    </div>
	    <!-- TABLE END -->
	 </div>
	    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    
    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-app.js"></script>

    <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
	database.js"></script>

    <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
	firestore.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-
	storage.js"></script>
    <!-- TODO: Add SDKs for Firebase products that you want to use
	https://firebase.google.com/docs/web/setup#available-libraries -->
    <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-
	analytics.js"></script>
	
	<!-- JQuery CDN LINK-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <!-- Script.js -->
    <script src="Assets/js/script.js"></script>
	
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
    </script>
    <script>
	    
	    function getdata() {
	    	var tbProduct = document.getElementById('tb_product');
		    var databaseRef = firebase.database().ref('products/');
		    var rowIndex = 1;
	    	 
	    	 databaseRef.once('value', function(snapshot) {
	    	 snapshot.forEach(function(childSnapshot) {
	    	 var childKey = childSnapshot.key;
	    	 var childData = childSnapshot.val();
	    	 
	    	
	    	 
	    	
	    	 
	    	 var row = tbProduct.insertRow(rowIndex);
				//Menambahkan cell atau kolom ID di dalam suatu baris yang sudah terbentuk dari kode di atas
				var cellId = row.insertCell(0);
				//Menambahkan cell atau kolom kode di samping kolom ID, ditandai dengan menggunakan indeks kolom (1)
				var cellImage = row.insertCell(1);
				var cellName = row.insertCell(2);
				var cellCategory = row.insertCell(3);
				var cellSize = row.insertCell(4);
				var cellPrice = row.insertCell(5);
				var cellQuantity = row.insertCell(6);
				var cellAction = row.insertCell(7); //Tambahin action  untuk tempat button
				
				cellId.appendChild(document.createTextNode(childKey));
				cellName.appendChild(document.createTextNode(childData.productName));
				cellCategory.appendChild(document.createTextNode(childData.category));
				cellSize.appendChild(document.createTextNode(childData.size));
				cellPrice.appendChild(document.createTextNode(childData.price));
				cellQuantity.appendChild(document.createTextNode(childData.quantity));
				

	    	 
	    	var storage = firebase.storage();
	    	var pathReference = storage.ref();
	    	pathReference.child('images/' + 
	    	childData.image).getDownloadURL().then(function(url) {
	    	 var img = document.createElement('img');
	    	 img.src = url;
	    	 img.width = 100;
	    	 img.height = 145;
	    	 img.style.display = 'inline-block';
	    	 img.style.position = 'relative';
	    	 img.style.borderRadius = '8px'; 
	    	 cellImage.appendChild(img);
	    	}).catch(function(error) {
	    	 // Handle any errors
	    	});
	    	
	    	//tambahin button di setiap row action jk di click, go to edit_product.jsp dengan mengambil id
	    	
	    	var button = document.createElement('button');
            button.className = 'btn btn-details';
            button.textContent = 'View Details';
            button.onclick = function() {
                // Redirect to the other page with the ID as a query parameter
                window.location.href = 'update_product.jsp?id=' + childKey;
            };

            //Button delete
            var button2 = document.createElement('button');
            button2.className = 'btn btn-delete';
            button2.textContent = 'delete';
            button2.onclick = function() {
            	//Mengambil id dari data
    			//var uid = document.getElementById('uid').value;
    			
    			//Menjalankan function delete data yang sesuai dengan id data yang telah terpilih
    			firebase.database().ref().child('/products/' + childKey).remove();
    			alert('Product successfully deleted!');
    			reload_page();
            };
            
            cellAction.appendChild(button);
            cellAction.appendChild(button2);
	    	 
	    	 rowIndex = rowIndex + 1;
	    	 });
	    	 
			    });
			  }		
	    
	    function reload_page(){
			window.location.reload();
		}
	    
	    function addProduct(){
	    	location.href = "add_product.jsp";
	    }
    </script>
    
  </body>
</html>