<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Product</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-rounded/css/uicons-thin-rounded.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/Assets/css/styles2.css">
  </head>
  <body onload="loadProductData()">
    <!-- ADD PRODUCT FORM START -->
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
    	
    	<div class="col-md-10 d-content">
    		<div class="row">
    			<div class="col text-start">
	                <p class="pro_tb">Update Product</p><br>
	            </div>
    		</div>
	    	<div class="row">
		      <form action="" id="productForm">
		        <div class="row g-3 mb-3">
		          <div class="col-md-6">
		            <label for="productId">ID</label>
		            <input type="text" class="form-control mt-2" id="productId" placeholder="ID-A01" required>
		          </div>
		          <div class="col-md-6">
		            <label for="productName">Name</label>
		            <input type="text" class="form-control mt-2" id="productName" placeholder="Product Name" required>
		          </div>
		        </div>
		        <div class="row g-3 mb-3">
		          <div class="col-md-6">
		            <label for="category">Category</label>
		            <select class="form-control mt-2" name="category" id="category" onchange="updateSubcategories()" required>
		              <option value="">Select Category</option>
		              <option value="top">Top</option>
		              <option value="bottom">Bottom</option>
		              <option value="accessories">Accessories</option>
		            </select>
		          </div>
		          <div class="col-md-6">
		            <label for="subcategory">Subcategory</label>
		            <select class="form-control mt-2" name="subcategory" id="subcategory" required>
		              <option value="">Select a subcategory</option>      
		            </select>
		          </div>
		        </div>
		        <div class="row g-3 mb-3">
		          <div class="col-md-6">
		            <label for="weight">Weight</label>
		            <input type="number" class="form-control mt-2" id="weight" min="0" placeholder="0.0Kg" required>
		          </div>
		          <div class="col-md-6">
		            <label for="price">Price</label>
		            <input type="number" class="form-control mt-2" id="price" min="0" placeholder="Rp10000" required>
		          </div>
		        </div>
		        <div class="row g-3 mb-3">
		          <div class="col-md-4">
		            <label for="size">Size</label>
		            <input type="text" class="form-control mt-2" id="size" placeholder="e.g S, M, L" required>
		          </div>
		          <div class="col-md-4">
		            <label for="color">Color</label>
		            <input type="text" class="form-control mt-2" id="color" placeholder="e.g Blue, Red, Pink" required>
		          </div>
		          <div class="col-md-4">
		            <label for="quantity">Quantity</label>
		            <input type="number" class="form-control mt-2" id="quantity" placeholder="e.g 100" required>
		          </div>
		        </div>
		        <div class="row g-3 mb-3">
		          <label for="desc">Description</label>
		          <textarea name="desc" id="desc" class="form-control" cols="30" rows="10" placeholder="Product Description"></textarea>
		        </div>
		        <div class="row g-3 mb-3">
		          <label for="images">Image</label>
		          <div class="drop-zone" id="dropZone">
		            <p>Drag and Drop Your Files Here</p>
		            <p>Or</p>
		            <button type="button" class="btn btn-choosefiles" onclick="chooseFiles()">Choose Files</button>
		            <div id="previewContainer" class="image-preview-container justify-content-center"></div>
		          </div>
		          <input type="file" id="fileInput" name="fileInput" multiple accept=".jpg, .jpeg, .png" style="display: none;">
		        </div>
		        <!-- VARIANTS TABLE -->
		        
		        <div class="row d-none">
		          <div class="col-md-6">
		            <h2>Variants</h2>
		          </div>
		          <div class="col-md-6">
		            <div class="d-sm-grid justify-content-md-end">
		              <button type="button" class="btn btn-primary" onclick="addVariantRow()">Add Variant</button>
		            </div>
		          </div>
		        </div>
		        <table class="table table-hover text-center d-none" id="variantsTable">
		          <thead>
		            <tr>
		              <th>Size</th>
		              <th>Color</th>
		              <th>Quantity</th>
		              <th></th>
		            </tr>
		          </thead>
		          <tbody class="bodyVariant d-none" id="variantBody">
		            <!-- Variants rows will be added dynamically using JavaScript -->
		            <td><input type="text" class="form-control" name="size" id="size"></td>
		            <td><input type="text" class="form-control" name="color" id="color"></td>
		            <td><input type="number" class="form-control" name="quantity" min="0" id="quantity"></td>
		            <td><button type="button" class="btn btn-danger" onclick="removeVariantRow(this)">Remove</button></td>
		          </tbody>
		        </table>
		       
				<div class="d-grid gap-2 d-md-flex justify-content-md-end but">
				  <button class="btn btn-outline-danger me-md-2" type="button" onclick="cancel()">Cancel</button>
		          <button type="submit" class="btn btn-addPro" onclick="update_product()">Update Product</button>
				</div>
		
		      </form>
		    </div>
	    </div>
    </div>
    <!-- ADD PRODUCT FORM END -->
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    
    <script src="/Assets/js/javascript.js"></script>
    
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
    </script>
    
    <script>
    function loadProductData() {
        // Get the ID from the query parameter
        const urlParams = new URLSearchParams(window.location.search);
        const id = urlParams.get('id');

        if (id) {
            // Retrieve the product data from the Firebase Realtime Database
            firebase.database().ref('products/' + id).once('value').then(function(snapshot) {
                const productData = snapshot.val();

                // Update the form fields with the product data
                document.getElementById('productId').value = productData.productId;
                document.getElementById('productName').value = productData.productName;
                document.getElementById('category').value = productData.category;
                //document.getElementById('subcategory').value = productData.subcategory;
                document.getElementById('size').value = productData.size;
                document.getElementById('color').value = productData.color;
                document.getElementById('price').value = productData.price;
                document.getElementById('quantity').value = productData.quantity;
                document.getElementById('desc').value = productData.desc;
                document.getElementById('weight').value = productData.weight;
                
                //Display the product image
                const storage = firebase.storage();
                const pathReference = storage.ref();
                pathReference.child('images/' + productData.image).getDownloadURL().then(function(url) {
                    const img = document.getElementById('image');
                    img.src = url;
                }).catch(function(error) {
                    Handle any errors
                });
            });
        }
    }
    
    var databaseRef = firebase.database().ref('products/');
    
    
    
	    function update_product() {
	  	  
		  	const file = document.querySelector('input[type="file"]').files[0];
		  	var storage = firebase.storage();
		  	var pathReference = storage.ref('images/');
		  	
		  	var metadata = {
		  			contentType: 'image/jpeg',
		  	};
		  	var uploadTask = pathReference.child(file.name).put(file,metadata);
		  		
		  	uploadTask
		  	 .then(snapshot => snapshot.ref.getDownloadURL())
		  	 .then((url) => {
		  	 console.log(url);
		  	 document.querySelector('input[type="file"]').src = url;
		  	 })
		  	 .catch(console.error);
		      // Retrieve form values
		      var productId = document.getElementById('productId').value;
		      var productName = document.getElementById('productName').value;
		      var category = document.getElementById('category').value;
		      var subcategory = document.getElementById('subcategory').value;
		      var weight = document.getElementById('weight').value;
		      var price = document.getElementById('price').value;
		      var size = document.getElementById('size').value;
		      var color = document.getElementById('color').value;
		      var quantity = document.getElementById('quantity').value;
		      var desc = document.getElementById('desc').value;
		      var image = file.name;
		      
		     // var productId = firebase.database().ref().child('addproducts').push().key;
		      
		      var data = {
						productId: productId,
						productName: productName,
						category: category,
						subcategory: subcategory,
						weight: weight,
						price: price,
						size: size,
						color: color,
						quantity: quantity,
						desc: desc,
						image: image
				}
		
		    //Update data dalam firebase dengan data baru
				var updates = {};
				updates['/products/' + productId] = data;
				firebase.database().ref().update(updates);
				
				alert('Product successfully updated!');
				reload_page();
			
	    }
	    
	    function reload_page(){
			window.location.reload();
		}
	    
	    function cancel(){
	    	location.href = "read_product.jsp";
	    }
    </script>
  </body>
</html>