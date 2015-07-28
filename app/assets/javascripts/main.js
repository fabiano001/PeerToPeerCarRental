$(".test").on("click", function(){
	window.alert("Alert!!!");
});

// Handle login click
$(".login-link").on("click", function(event) {
	event.preventDefault();

	if($('.js-modal-signup').is(":visible")){
		$('.js-modal-signup').modal("hide");
	}

	if($('.header-toggle').is(":visible")){
		$('.header-toggle').hide();
	}

	$('.js-modal-login').modal();
	$('header').height($( window ).height());
});

// Handle signup click
$(".signup-link").on("click", function(event) {
	event.preventDefault();

	if($('.js-modal-login').is(":visible")){
		$('.js-modal-login').modal("hide");
	}

	if($('.header-toggle').is(":visible")){
		$('.header-toggle').hide();
	}

	$('.js-modal-signup').modal();
	$('header').height($( window ).height());
});

// Show header contents when login modal is dismissed
$('.js-modal-login').on('hide.bs.modal', function () {
  if($('.header-toggle').is("visible")){
		$('.header-toggle').hide();
	}
	else{
		$('.header-toggle').show();
	}
});

// Show header contents when signup modal is dismissed
$('.js-modal-signup').on('hide.bs.modal', function () {

	if($('.header-toggle').is("visible")){
		$('.header-toggle').hide();
	}
	else{
		$('.header-toggle').show();
	}
});

$(document).on('ready', function (event) {
	$('header').height($( window ).height());
});

$(window).resize(function() {
  $('header').height($( window ).height());
});


