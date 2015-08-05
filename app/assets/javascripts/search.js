$(document).on('ready', function (event) {
    // $('.search-results').hide();
    // $('.search-results').empty();

    //$('.car-search-filter-controls').hide();

    $('#datetimepicker6').datetimepicker();
    $('#datetimepicker7').datetimepicker();
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});

$('.car-search-btn').on('click', function(event){

    $('.search-results').empty();
    $('.car-search-controls').hide();

	// grab search query
	var searchUrl = '/search'; // add params here for a refined search

	// do ajax call to search for cars
	$.ajax({
        method: "post",
        url: searchUrl,
        success: (function(serverResponse){
            console.debug('Server Response: ' + serverResponse);
            displayResults(serverResponse);
        }),
        error: (function(serverResponse, errorMsg){
            console.debug('ERROR MESSAGE: ' + errorMsg);
            displayResults(errorMsg);
        })
    });

    $('.car-search-filter-controls').show();

});

function displayResults(serverResponse){

    var htmlArray = [];

    serverResponse.forEach(function(car, i) {

        htmlArray.push('<div class="row price-per-day">');
        htmlArray.push('<div class="col-sm-4 col-sm-offset-4">');
        htmlArray.push('<a href="/cars/' + serverResponse[i].id + '">');
        htmlArray.push('<div class="pt-package-3-sm">');
        htmlArray.push('<div class="pt-header-sm-sr" style="background-color:"+thirdPackageColor+";">');
        htmlArray.push('<h3>');
        htmlArray.push(serverResponse[i].year + ' ' + serverResponse[i].make + ' ' + serverResponse[i].model);
        htmlArray.push('</h3>');
        htmlArray.push('</div>');
        htmlArray.push('</div><!--/pt-package-3-->');
        htmlArray.push('</div><!--col-sm-4 col-sm-offset-4--></div><!--row price-per-day-->');
        htmlArray.push('<div class="row car-pics">');
        htmlArray.push('<div class="col-sm-4 col-sm-offset-4">');
        htmlArray.push('<img class="car-pics-img" src="' + serverResponse[i].pictures[0].path + '">');
        htmlArray.push('</div>');
        htmlArray.push('<!--/col-sm-4 col-sm-offset-4--></div><!--/row car-pics-->');
        htmlArray.push('</a>');
    });

    var html = htmlArray.join('');
    
    $('.search-results').append(html);
    $('.search-results').show();

    saveSearchResults(html);
}

function saveSearchResults(html){
    var searchUrl = '/cache-users-search';

    // do ajax call to search for cars
    $.ajax({
        method: "post",
        url: searchUrl,

        data: {
            user_search_html: html
        },

        success: (function(serverResponse){
            console.debug('Server Response: ' + serverResponse);
        }),
        error: (function(serverResponse, errorMsg){
            console.debug('ERROR MESSAGE: ' + errorMsg);
        })
    });
}

// <script type="text/javascript">
//         $(function () {
//         $('#datetimepicker6').datetimepicker();
//         $('#datetimepicker7').datetimepicker();
//         $("#datetimepicker6").on("dp.change", function (e) {
//         $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
//         });
//         $("#datetimepicker7").on("dp.change", function (e) {
//         $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
//         });
//         });
//     </script>


           
                
                