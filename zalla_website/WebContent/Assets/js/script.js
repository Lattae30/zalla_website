//Sub Menu Dropdown Button
$(document).ready(function(){
	//Toggle Sub Menu
	$('.z-sub-btn ').click(function(){
		$(this).next('.z-sub-menu').slideToggle();
		$(this).find('.z-dropdown').toggleClass('z-rotate');
	});
});

function clock(){
  var date = new Date();
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var midday;
  
  var month = ["January", "Feburary", "March", "April", "Mei", "June", "July", "August", "September", "October", "November", "December"];
  var dayList = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

  //IF EELSE FOR AM / PM CONDITION
  midday = (hours >= 12) ? "PM" : "AM";

  document.getElementById("current-time").innerHTML = "<span>" + hours + "</span>" + ":" + "<span>" + minutes + "</span>" + "<span> " + midday + "</span>"

  var time = setTimeout(function(){
    clock();
  }, 1000);

  //Good morning, good evening, good afternoon condition
  if(hours < 12){
    var greeting = "Good morning, admins"
  }
  if(hours >= 12 && hours <= 18){
    var greeting = "Good afternoon, admins"
  }
  if(hours >=18 && hours <=24){
    var greeting = "Good evening, admins"
  }

  document.getElementById("greetings").innerHTML = greeting;

  // DAY & DATE
  var day = date.getDay();
  var currentDate = date.getFullYear() + "/" + (date.getMonth()+1) + date.getDate();

  document.getElementById("currentDate").innerHTML = dayList[day] + ", " + month[date.getMonth()] + " " + date.getDate();
}

// Call clock function
clock();