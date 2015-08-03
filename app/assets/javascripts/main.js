// Make header the size of screen
$(document).on('ready', function (event) {
	
	if(window.location.pathname==='/cars/new' || window.location.pathname==='/cars'){
		callEdmundsApi("populateCarMakers");

		if($('#newCarErrorModal').attr('error') === 'true'){
			$('#newCarErrorModal').modal('show');
		}
	}
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

// When user selects a car make, populate the car models associated with that make
$('.form_car-makers').change(function() {
	// Set car models dropdown to disabled
	$('.form_car-models').prop('disabled', true);
	callEdmundsApi("populateCarModels");
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
