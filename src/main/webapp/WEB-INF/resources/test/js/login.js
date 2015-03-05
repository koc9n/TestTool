var vkButton = '<button class="btn waves-effect waves-light light-blue" onclick="VK.Auth.login(authInfo);">Login VK</button>';
var isLogined = false;
var user = {};

function authInfo(response) {
    if (response.session) {
        user.name = response.session.user.first_name
        + " " + response.session.user.last_name;
        user.profileId = response.session.user.id;

        login();
    } else {
        alert('not auth');
    }
}


// end of jQuery name space
$(document).ready(function () {
    $('select').material_select();
    VK.init({
        apiId: 4812455
    });
    isAuthenticated();
});
$(window).resize(function () {
    if (isLogined) {
        if ($(window).width() < 993) {
            $('ul.right').hide();
        } else {
            $('ul.right').show();
        }
    }
});

var startTest = function () {
    $.ajax({
        url: 'start',
        method: 'POST',
        dataType: 'JSON',
        cache: false,
        data: $('form').serialize(),
        success: function (data) {
            console.log(data.status);
            window.location.replace("testpage");
        },
        error: function (err) {
            console.log(err.responseText);
        }
    });
};

var login = function () {
    $.ajax({
        url: 'login',
        method: 'POST',
        dataType: 'JSON',
        cache: false,
        data: user,
        success: function (data) {
            console.log(data.status);
            isLogined = data;
            initPage();
        },
        error: function (err) {
            console.log(err.responseText);
        }
    });
};

function initPage() {
    if (isLogined) {

        $('ul.right,ul#nav-mobile').show();

        $('.container > .row .col:eq(1)').show();

        $("#login").empty();
        $("#login").text("Welcome, " + user.name);
        if ($(window).width() < 993) {
            $('ul.right').hide();
            $('.button-collapse').show();
            $('.button-collapse').sideNav();
        }
    } else {
        $('.button-collapse').hide();
        $('.container > .row .col:eq(1)').hide();
        $('ul.right,ul#nav-mobile').hide();
        $("#login").html(vkButton);
    }
}
var isAuthenticated = function () {
    $.ajax({
        url: 'isauthenticated',
        method: 'GET',
        dataType: 'JSON',
        cache: false,
        success: function (data) {
            console.log(data);
            isLogined = data == "" ? false : true;
            user = data;
            initPage();
        },
        error: function (err) {
            console.log(err.responseText);
            isLogined = false;
            initPage();
        }
    });
};
