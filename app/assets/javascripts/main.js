// Make header the size of screen
$(document).on('ready', function (event) {

	callEdmundsApi("populateCarMakers");

	if(window.location.pathname==='/cars/new' || window.location.pathname==='/cars'){

		if($('#newCarErrorModal').attr('error') === 'true'){
			$('#newCarErrorModal').modal('show');
		}

		// Set Defaults for Demo
		$('.form_car-years').val("2007");
		$('.form_car-types').val("Car");
		$('.form_car-body-types').val("Convertible");
		$('.form_car-sizes').val("Midsize");
		$('.form_car-types').val("Car");
		$('.form_car-colors').val("Blue");
		$('.form_car-transmissions').val("Manual");
		$('.form_car-engine-types').val("8 Cylinder");
		$('.form_car-driven-wheels').val("Front-wheel-drive");
		$('.form_car-fuel-types').val("Gas");
		$('.form_car-conditions').val("Excellent");
		$('.form_car-prices').val("$30.00");

		$('.form_car-address-line').val("7201 Ranch Road 2222");
		$('.form_car-city-line').val("Austin");
		$('.form_car-state-line').val("TX");

		$('.form_car-audio-input').prop('checked', true);
		$('.form_car-abs').prop('checked', true);
		$('.form_car-ac').prop('checked', true);
		$('.form_car-gps').prop('checked', true);
		$('.form_car-electric-doors').prop('checked', true);
		$('.form_car-electric-seats').prop('checked', true);


		var default_desc = 'This Mustang convertible is looking amazing. Rent my car and drive in style. This is '
			+ 'the perfect weather to drive around town in this sporty looking car. I use this car on occasion and ' 
			+ 'enjoy driving it every time. \n\nIts loaded with power everything and leather, and the convertible top '
			+ 'opens with a push of a button. This car is the perfect size. I am right next door to the NJ transit '
			+ 'Train stop in Hackensack on Essex st. \n\nFrom NYC penn station, thats only a short 20-30 min ride. I will '
			+ 'meet anyone there at the Hackensack NJ Bus Station or Train Station if it makes it easier. Or i can offer '
			+ 'delivery. Just contact me about that.';

		$('.form_car-description').val(default_desc);
	}
});

// Handle login click
$(".login-link").on("click", function(event) {
	event.preventDefault();

	var redirectType = $(event.target).data("redirect");

	var carId = $(event.target).data("carid");

	if (!redirectType) {
		redirectType = "default";
	}

	var url = "/redirect/" + redirectType;
	if (carId) {
		url = url + '?car_id=' + carId;
	}

	$.ajax({ url: url, type: "post" });
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

// When user selects a car make, populate the car models associated with that make
$('.form_car-makers').change(function() {
	// Set car models dropdown to disabled
	$('.form_car-models').prop('disabled', true);
	callEdmundsApi("populateCarModels");
});

// **************** search filters ********** //
// When user selects a car type, filter out accordinly
$('.form_car-types-filter').change(function() {
	var typeFilter = $('.form_car-types-filter').val();
	window.location.href = "/cars/?type=" + typeFilter;
});

// When user selects a car body type, filter out accordinly
$('.form_car-body-types-filter').change(function() {
	var bodyTypeFilter = $('.form_car-types-filter').val();
	window.location.href = "/cars/?bodytype=" + bodyTypeFilter;
});

// When user selects a car model, filter out accordinly
$('.form_car-models-filter').change(function() {
	var modelFilter = $('.form_car-models-filter').val();
	window.location.href = "/cars/?model=" + modelFilter;
});

// When user selects a car make, filter out accordinly
$('.form_car-makers-filter').change(function() {
	var makeFilter = $('.form_car-makers-filter').val();
	window.location.href = "/cars/?make=" + makeFilter;
});

// ****************************************** //

// When user selects a car type, filter out accordinly
$('.form_car-body-types-filter').change(function() {
	var bodyTypeFilter = $('.form_car-types-filter').val();
	window.location.href = "/cars/?bodytype=" + bodyTypeFilter;
});

// Call edmunds api to get list of car makers
function callEdmundsApi(requestType){
	// grab search query
	var queryUrl = 'https://api.edmunds.com/api/vehicle/v2/makes?view=basic&fmt=json&api_key=vrmzr6w225qvt46z47gazvuy';
	console.debug('API Call Url:' + queryUrl);

	// do ajax call to get car makers
	$.ajax({
        url: queryUrl,
        success: (function(serverResponse){
            console.debug('Server Response: ' + serverResponse);
            if(requestType==="populateCarMakers"){
            	loadCarMakersDropown(serverResponse);	
            }
            else{
            	loadCarModelsDropdown(serverResponse);
            }
            
        }),
        error: (function(serverResponse, errorMsg){
            console.debug('ERROR MESSAGE: ' + errorMsg);
        })
    });
}

function loadCarMakersDropown(serverResponse){

	var $form_car_makers = $('.form_car-makers');

	// populate car makers dropdown
    serverResponse.makes.forEach(function (carMaker, index) {

    	var option = document.createElement("option");
	    option.value = serverResponse.makes[index].name;
	    option.text = serverResponse.makes[index].name;
    	$form_car_makers.append(option);
    });

     // Append "Other" selection
	var option = document.createElement("option");
    option.value = "Other";
    option.text = "Other";
	$form_car_makers.append(option);
}

function loadCarModelsDropdown(serverResponse){

	var $form_car_models = $('.form_car-models');

	// empty models list
	$form_car_models.empty();

	// Append "select" prompt
	var option = document.createElement("option");
    option.value = "Select model";
    option.text = "Select model";
	$form_car_models.append(option);

	// populate car models dropdown
    serverResponse.makes.forEach(function (carMaker, index) {

    	if(serverResponse.makes[index].name === $('.form_car-makers').val()){
    		// Found our make, populate models
    		serverResponse.makes[index].models.forEach(function (model, i) {

    			var option = document.createElement("option");
			    option.value = model.name;
			    option.text = model.name;
		    	$form_car_models.append(option);
    		});
    	}
    	
    });

    // Append "Other" selection
	option = document.createElement("option");
    option.value = "Other";
    option.text = "Other";
	$form_car_models.append(option);

	// Enable dropdown
 	$form_car_models.removeAttr('disabled');
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
