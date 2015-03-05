INSERT INTO `test` SET `name`='java basic';
INSERT INTO Question SET content='How much primitive types are in Java?', test_id=1, isMultipleAnswers=FALSE ;
INSERT INTO Answer SET content='5', question_id=1, isCorrect=FALSE;
INSERT INTO Answer SET content='8', question_id=1, isCorrect=TRUE ;
INSERT INTO Answer SET content='6', question_id=1, isCorrect=FALSE;
INSERT INTO Answer SET content='10', question_id=1, isCorrect=FALSE;
INSERT INTO Question SET content='What of the following are keywords in Java?', test_id=1, isMultipleAnswers=TRUE ;
INSERT INTO Answer SET content='default', question_id=2, isCorrect=TRUE;
INSERT INTO Answer SET content='null', question_id=2, isCorrect=FALSE;
INSERT INTO Answer SET content='void', question_id=2, isCorrect=TRUE;
INSERT INTO Answer SET content='continue', question_id=2, isCorrect=TRUE;

INSERT INTO `test` SET `name`='jquery basic';
INSERT INTO Question SET content='How to change text color of first p element in div to yellow?', test_id=2, isMultipleAnswers=TRUE ;
INSERT INTO Answer SET content='$("div > p")[0].css({"color":"yellow"});', question_id=3, isCorrect=TRUE;
INSERT INTO Answer SET content='$("div > p:eq(0)")[0].style.color = "yellow";', question_id=3, isCorrect=TRUE ;
INSERT INTO Answer SET content='$("div > p:first").style.color = "yellow";', question_id=3, isCorrect=FALSE;
INSERT INTO Answer SET content='$("div > p:first-child").css({"color":"yellow"});', question_id=3, isCorrect=TRUE ;
INSERT INTO Question SET content='What will occurs firstly?', test_id=2, isMultipleAnswers=FALSE;
INSERT INTO Answer SET content='$(document).ready()', question_id=4, isCorrect=TRUE;
INSERT INTO Answer SET content='$(window).load()', question_id=4, isCorrect=FALSE;
INSERT INTO Answer SET content='both at the same time', question_id=4, isCorrect=FALSE;

