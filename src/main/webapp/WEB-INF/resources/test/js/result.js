
// end of jQuery name space
$(document).ready(function () {
    if ($(window).width() < 993) {
        $('ul.right').hide();
    } else {
        $('ul.right').show();
    }
    $('select').material_select();
    $('.button-collapse').sideNav();
    getResults();

});
$(window).resize(function () {
        if ($(window).width() < 993) {
            $('ul.right').hide();
        } else {
            $('ul.right').show();
        }
});

var getResults = function(){
    $.ajax({
        url: 'getresults',
        method: 'GET',
        dataType: 'JSON',
        cache: false,
        success: function (data) {
            console.log(data);
            $.each(data, function(index, value){
                var tmp = value.finishTime;
                tmp = tmp.replace("T", " ");
                tmp = tmp.substring(0, tmp.lastIndexOf('.'));
                value.finishTime = tmp;
                data[index] = value;
            });

            $('#resultTmpl').tmpl(data).prependTo('#result');
        },
        error: function(err) {
            console.log(err);
        }
    });
};

