// Make header the size of screen
$(document).on('ready', function (event) {
	if(window.location.pathname==='/cars/new'){
		loadCarMakersDropdown();
	}
});

// Make header the size of screen
$(window).resize(function() {
  // $('header').height($( window ).height());
});

// Handle login click
$(".login-link").on("click", function(event) {
	event.preventDefault();

	var redirectType = $(event.target).data("redirect");

	if (!redirectType) {
		redirectType = "default";
	}

	$.ajax({ url: "/redirect/" + redirectType, type: "post" });
	showLoginModal();
});

// Handle signup click
$(".signup-link").on("click", function(event) {
	event.preventDefault();
	showRegistrationModal();
});

// Show header contents when login modal is dismissed
$('.js-modal-login').on('hide.bs.modal', function () {
  showHeaderContents();
});

// Show header contents when signup modal is dismissed
$('.js-modal-signup').on('hide.bs.modal', function () {
	showHeaderContents();
});

// Handle call to action click by the user
$('.call-to-action').on('click', function() {
	
});

// Call edmunds api to get list of car makers
function loadCarMakersDropdown(){
	// grab search query
	var queryUrl = 'https://api.edmunds.com/api/vehicle/v2/makes?view=basic&fmt=json&api_key=vrmzr6w225qvt46z47gazvuy';
	console.debug('API Call Url:' + queryUrl);

	// do ajax call to get car makers
	$.ajax({
        url: queryUrl,
        success: (function(serverResponse){
            console.debug('Server Response: ' + serverResponse);
            
            // populate car makers dropdown
            serverResponse.makes.forEach(function (carMaker, index) {

            	var option = document.createElement("option");
			    option.value = parseInt(index + 1);
			    option.text = serverResponse.makes[index].name;
            	$('.form_car-makers').append(option);
            });
        }),
        error: (function(serverResponse, errorMsg){
            console.debug('ERROR MESSAGE: ' + errorMsg);
        })
    });
}

function showRegistrationModal(){
	if($('.js-modal-login').is(":visible")){
		$('.js-modal-login').modal("hide");
	}

	if($('.header-toggle').is(":visible")){
		$('.header-toggle').hide();
	}

	$('.js-modal-signup').modal();
}

function showLoginModal(){
	if($('.js-modal-signup').is(":visible")){
		$('.js-modal-signup').modal("hide");
	}

	if($('.header-toggle').is(":visible")){
		$('.header-toggle').hide();
	}

	$('.js-modal-login').modal("show");
}

function showHeaderContents(){
	if($('.header-toggle').is("visible")){
		$('.header-toggle').hide();
	}
	else{
		$('.header-toggle').show("show");
	}
}

$(".test").on("click", function(){
	window.alert("Alert!!!");
});
