<%--
  Created by IntelliJ IDEA.
  User: k.mironchik
  Date: 10/1/2014
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="true" %>
<html>
<head>
    <title>Enter to Chat</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/materialize/css/materialize.css" type="text/css" media="screen,projection"/>

    <script src='/resources/jquery-1.11.2.js'></script>
    <script src='/resources/jquery.tmpl.js'></script>
    <script src="/resources/materialize/js/materialize.js"></script>

    <script src="/resources/test/js/testProcess.js"></script>
</head>
<body>
<script id="radioTmpl" type="text/x-jquery-tmpl">
    <p>
        <input type="radio" name="answers" id="${id}" value="${id}"/>
        <label for="${id}"> ${content} </label>
    </p>
</script>
<script id="checkboxTmpl" type="text/x-jquery-tmpl">
    <p>
        <input type="checkbox" name="answers" id="${id}" value="${id}"/>
        <label for="${id}"> ${content} </label>
    </p>
</script>
<nav class="light-green lighten-1" role="navigation">
    <div class="container">
        <div class="nav-wrapper">
            <a id="logo-container" href="/" class="brand-logo">Test System</a>
        </div>
    </div>
</nav>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <div id="question" class="row">
                            <div class="col s10 m10">
                                <h4>Question:</h4>

                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus dolorum eligendi
                                    iste. Aperiam assumenda dignissimos eum excepturi hic itaque minima nobis, omnis
                                    qui.
                                    Corporis, exercitationem fuga iusto tempora tenetur unde?</p>
                            </div>
                            <div class="col s2 m2">
                                <span class="right">
                                    Time to answer: <br/>
                                    <span id="timeCounter" class="badge">30</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <div class="row">
                            <form id="answers" action="#">

                                    Answers:

                            </form>
                            <button onclick="submit()" class="btn waves-effect waves-light right" type="submit">next
                                <i class="mdi-content-send right"></i>
                            </button>
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

</body>
</html>
