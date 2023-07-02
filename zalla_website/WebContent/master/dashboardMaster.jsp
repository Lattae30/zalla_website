<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap Connection -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- Icon -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-rounded/css/uicons-thin-rounded.css'>
  <!-- CSS -->
  <link rel="stylesheet" href="/Assets/css/styles2.css">
  <title>Admin Dashboard | Zalla</title>
</head>
<body> 
  <!-- Main Container -->
  <div class="container-fluid d-flex">
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

    <div class="col-md-10 d-flex d-content">
       <!-- START GREETINGS ROW -->
       <div class="row">
        <div class="col-md-12">
          <div class="col-md-8 d-flex card-greeting justify-content-center align-items-center px-3 py-3">
            <div class="col-md-5">
              <h3 id="greetings"></h3>
              <p class="p-wellcome">Here, you can manage the Zalla's product</p>
            </div>
            <div class="col-1 col-sm-1 col-md-1 col-xxl-1 mt-4 justify-content-end">
              <div class="vertical-line justify-content-end ms-3"></div>
            </div>
            <div class="col-md-4 d-flex">
              <div class="time-widget">
                <div>
                  <p class="d-day">Today:</p>
                  <h2 id="current-time"></h2>
                  <h6 id="currentDate"></h6>
                </div>
              </div>
            </div>
            <div class="col-md-1 d-flex">
              <i class="fi fi-tr-clock-five clock"></i>
            </div>
          </div>

          <!-- START GRAPH -->
          <div class="col-md-4 d-flex graph-sec justify-content-center align-items-center px-3 py-3">
            <div class="col-md-5">
              <h3>Zalla's Sub-Categories Product Chart</h3>
            </div>
            <div class="col-1 col-sm-1 col-md-1 col-xxl-1 mt-4 justify-content-end">
              <div class="vertical-line2 justify-content-end ms-3"></div>
            </div>
            <div class="col-md-7 d-flex my-chart px-5" style="margin-left: -60px">
              <canvas style="width: -50px; height: 100px;" id="myChart"></canvas>
            </div>
          </div>
          <!-- END GRAPH -->

        </div>
      </div>
    </div>

    <div class="col-md-1 d-flex d-content">
      <div class="social">
        <ul>
          <li><a href="facebook.com"></a><i class='bx bxl-facebook '></i></li>
          <li><a href="intagram.com"></a><i class='bx bxl-instagram sc-icon' ></i></li>
          <li><a href="tiktok.com"></a><i class='bx bxl-tiktok sc-icon' ></i></li>
          <li><a href="youtube.com"></a><i class='bx bxl-youtube sc-icon' ></i></li>
        </ul>
      </div>
    </div>
    
    
  

  </div>

  <!-- Bootstrap JS Connection -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

		
  <!-- The core Firebase JS SDK is always required and must be listed first -->
  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-app.js"></script>

  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-database.js"></script>

  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-firestore.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-storage.js"></script>
  <!-- TODO: Add SDKs for Firebase products that you want to use https://firebase.google.com/docs/web/setup#available-libraries -->
  <script src="https://www.gstatic.com/firebasejs/7.15.0/firebase-analytics.js"></script>	
 
  <!-- JQuery CDN LINK-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 
  <script src="/Assets/js/script.js"></script>
 
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  
  <!-- FIREBASE CONNECTION -->
  <script>
	    const firebaseConfig = {
	    		apiKey: "AIzaSyCzrsurHC2-tv36qFVQxUxAKlpXiBnfuMQ",
	    	    authDomain: "atsil-realtime-try.firebaseapp.com",
	    	    databaseURL: "https://atsil-realtime-try-default-rtdb.firebaseio.com",
	    	    projectId: "atsil-realtime-try",
	    	    storageBucket: "atsil-realtime-try.appspot.com",
	    	    messagingSenderId: "484969721928",
	    	    appId: "1:484969721928:web:893fb79a893976119ae87d",
	    	    measurementId: "G-K8ZWFT6E40"
	    	  };
	
	    	  // Initialize Firebase
	    firebase.initializeApp(firebaseConfig);
	    firebase.analytics();
   </script>
  
  <!-- BAR CHART SCRIPT -->
  <script>
  
  // Get a reference to the Firebase database
  const database = firebase.database();

  // Fetch the data from Firebase
  const fetchData = async () => {
    try {
      const snapshot = await database.ref('addproducts').once('value');
      const data = snapshot.val();
      
      // Count the stock for each category
      const stockCount = {};
      for (const key in data) {
        const item = data[key];
        const subcategory = item.subcategory;

        if (stockCount[subcategory]) {
          stockCount[subcategory] += parseInt(item.quantity);
        } else {
          stockCount[subcategory] = parseInt(item.quantity);
        }
      }

      // Prepare the chart data
      const labels = Object.keys(stockCount);
      const stockValues = Object.values(stockCount);

      // Create the chart using Chart.js
      const ctx = document.getElementById('myChart').getContext('2d');
      new Chart(ctx, {
        type: 'bar',
        data: {
          labels: labels,
          datasets: [{
            label: '# of Items',
            data: stockValues,
            backgroundColor: 'rgb(255, 248, 222, 0.5)',
            borderColor: 'rgb(255, 248, 222)',
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    } catch (error) {
      console.log(error);
    }
  };

  // Call the fetchData function to fetch data and create the chart
  fetchData();
  </script>
</body>
</html>