// Make header the size of screen
$(document).on('ready', function (event) {
	// $('header').height($( window ).height());
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
