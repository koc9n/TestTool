<%--
  Created by IntelliJ IDEA.
  User: k.mironchik
  Date: 10/1/2014
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Enter to Chat</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/materialize/css/materialize.css" type="text/css" media="screen,projection"/>
    <script src="//vk.com/js/api/openapi.js" type="text/javascript"></script>
    <script src='/resources/jquery-1.11.2.js'></script>
    <script src="/resources/materialize/js/materialize.js"></script>
</head>
<body>
<nav class="light-green lighten-1" role="navigation">
    <div class="container">
        <div class="nav-wrapper">
            <a id="logo-container" href="/" class="brand-logo">Test System</a>
            <ul class='right'>
                <li>
                    <a href="/results">Results</a>
                </li>
                <li>
                    <a href="/logout">Logout</a>
                </li>
            </ul>

            <ul id='nav-mobile' class='side-nav'>

                <li>
                    <a href="/results">Results</a>
                </li>
                <li>
                    <a href="/logout">Logout</a>
                </li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse">
                <i class="mdi-navigation-menu"></i>
            </a>
        </div>
    </div>
</nav>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col s12 m6">
                <div class="card">
                    <div id="login" class="card-content">

                    </div>
                </div>
            </div>
            <div class="col s12 m6">
                <div class="card">
                    <div class="card-content">
                        <div class="row">
                            <form action="/start" method="post">
                                <div class="input-field">
                                    <select id="testId" name="testId">
                                        <i class="mdi-action-list prefix"></i>
                                        <option value="" disabled selected>Choose the test</option>
                                        <c:forEach items="${tests}" var="test">
                                            <option value="${test.id}">${test.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <button class="btn waves-effect waves-light right" onclick="startTest()">Start
                    <i class="mdi-content-send right"></i>
                </button>
            </div>
        </div>
    </div>
</div>
<footer class="page-footer light-green lighten-1">
    <div class="container">
        <div class="copyright">
            <p class="white-text">Site is powered by Konstantin Mironchik. All rigths reserved.</p>
        </div>
    </div>
</footer>

<script language="javascript">
    var vkButton = '<div class="btn waves-effect waves-light light-blue center" onclick="VK.Auth.login(authInfo);">Login VK</div>';
    var isLogined = false;
    var user = {};
    VK.init({
        apiId: 4812455
    });
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


</script>
</body>

</html>
