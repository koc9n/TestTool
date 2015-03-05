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
</head>
<body>
<nav class="light-green lighten-1" role="navigation">
    <div class="container">
        <div class="nav-wrapper">
            <a id="logo-container" href="/" class="brand-logo">Test System</a>
            <ul class="right">
                <c:if test="${sessionData.user != null}">
                    <li>
                        <a href="/results">Results</a>
                    </li>

                    <li>
                        <a href="/logout">Logout</a>
                    </li>
                </c:if>
            </ul>
            <ul id="nav-mobile" class="side-nav">
                <c:if test="${sessionData.user != null}">
                    <li>
                        <a href="/results">Results</a>
                    </li>

                    <li>
                        <a href="/logout">Logout</a>
                    </li>
                </c:if>
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
            <div class=" s12 m12">
                <div class="card">
                    <div class="card-content">
                        <div class="row">
                            <blockquote>
                                <p>${sessionData.user.name}, here you can see you results.</p>
                            </blockquote>
                            <table>
                                <thead>
                                <tr>
                                    <th data-field="name">Test</th>
                                    <th data-field="price">Score</th>
                                    <th data-field="price">Finish Time</th>
                                </tr>
                                </thead>
                                <tbody id = "result">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
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
<script src='/resources/jquery-1.11.2.js'></script>
<script src="/resources/materialize/js/materialize.js"></script>
<script>


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
                    $("#result").prepend("<tr><td>"+value.test.name+"</td>" +
                    "<td>"+value.score+"</td><td>"+new Date(value.finishTime)+"</td></tr>");
                });

            },
            error: function(err) {
                console.log(err);
            }
        });
    };
</script>
</body>

</html>
