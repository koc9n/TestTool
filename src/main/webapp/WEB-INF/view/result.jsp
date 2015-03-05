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
    <script src='/resources/jquery-1.11.2.js'></script>
    <script src='/resources/jquery.tmpl.js'></script>
    <script src="/resources/materialize/js/materialize.js"></script>
    <script src="/resources/test/js/result.js"></script>
</head>
<body>
<%@ page isELIgnored="true" %>
<script id="resultTmpl" type="text/x-jquery-tmpl">
<tr><td>${test.name}</td>
<td>${score}</td>
<td>${finishTime}</td></tr>
</script>

<nav class="light-green lighten-1" role="navigation">
    <div class="container">
        <div class="nav-wrapper">
            <a id="logo-container" href="/" class="brand-logo">Test System</a>
            <ul class="right">
                    <li>
                        <a href="/results">Results</a>
                    </li>

                    <li>
                        <a href="/logout">Logout</a>
                    </li>
            </ul>
            <ul id="nav-mobile" class="side-nav">
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
            <div class="col center-align s12 m12">
                <div class="card">
                    <div class="card-content">
                        <div class="row">
                                <p>Here you can see results of tests.</p>
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
                <button class="btn waves-effect waves-light center" onclick="window.location='/'">Back to main page
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

</body>

</html>
