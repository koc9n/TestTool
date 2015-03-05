$(document).ready(function () {
    $('select').material_select();
    currentQuestion();
});


var calculateScore = function(){
    $.ajax({
        url: 'calculatescore',
        method: 'POST',
        dataType: 'JSON',
        cache: false,
        data: $('form').serialize(),
        success: function (data) {
            console.log(data.status);
            nextQuestion();
        },
        error: function(err) {
            console.log(err);
        }
    });
};
var nextQuestion = function(){
    $.ajax({
        url: 'nextquestion',
        method: 'GET',
        dataType: 'JSON',
        cache: false,
        success: function (data) {
            var res = data.next;
            if (res != null) {
                initQuestion(res);
            } else {
                saveResults();
                window.location.replace("results");
            }
        },
        error: function(err) {
            console.log(err);
        }
    });
};
var currentQuestion = function(){
    $.ajax({
        url: 'currentquestion',
        method: 'GET',
        dataType: 'JSON',
        cache: false,
        success: function (data) {
            var res = data.next;
            if (res != null) {
                initQuestion(res);
            } else {
                nextQuestion();
            }
        },
        error: function(err) {
            console.log(err);
        }
    });
};
var saveResults = function(){
    $.ajax({
        url: 'saveresults/' + getTimeZoneOffset(),
        method: 'GET',
        dataType: 'JSON',
        cache: false,
        success: function (data) {
            console.log(data);
        },
        error: function(err) {
            console.log(err);
        }
    });
};
var initQuestion = function (question) {
    $('#question p').text(question.content);
    $('#answers').empty();
        if (question.multipleAnswers) {
            $('#checkboxTmpl').tmpl(question.answers).prependTo('#answers');
        } else {
            $('#radioTmpl').tmpl(question.answers).prependTo('#answers');
        }
    timeCounter = initCounter();
    intervalId = setInterval(updateTimeCounter, 1000);
}

var timeCounter = initCounter();
function initCounter() {
    var counter = 31;
    return function () {
        return counter -= 1;
    }
}

function submit(){
    clearInterval(intervalId);
    calculateScore();
}

var updateTimeCounter = function () {
    var time = timeCounter();
    if (time > 0) {
        $('#timeCounter').text(time);
    } else {
        $('#timeCounter').text(time);

        submit();
    }
};

function getTimeZoneOffset(){
    var timeZone = new Date().getTimezoneOffset();
    var sign = timeZone < 0 ? "+" : "-";
    if (sign == "+") timeZone = timeZone * -1;
    return sign
        + (((timeZone/60) > 9) ? (timeZone/60) : ("0" + timeZone/60))
        + ":"
        + (((timeZone%60) > 9) ? (timeZone%60) : ("0" + timeZone%60));
}

var intervalId;