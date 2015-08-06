$(document).on('ready', function (event) {
    // $('.search-results').hide();
    // $('.search-results').empty();

    //$('.car-search-filter-controls').hide();

    $('#datetimepicker6').datetimepicker();
    $('#datetimepicker7').datetimepicker();
});

$('.carview-goback-btn').on('click', function(){
    history.go(-1);
});

$('.rentconfirm-goback-btn').on('click', function(){
    history.go(-1);
});