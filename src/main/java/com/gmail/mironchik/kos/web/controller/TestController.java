package com.gmail.mironchik.kos.web.controller;

import com.gmail.mironchik.kos.web.dao.TestRepository;
import com.gmail.mironchik.kos.web.dto.ResponseStatus;
import com.gmail.mironchik.kos.web.dto.TestResult;
import com.gmail.mironchik.kos.web.dto.User;
import com.gmail.mironchik.kos.web.model.Answer;
import com.gmail.mironchik.kos.web.model.Question;
import com.gmail.mironchik.kos.web.model.Test;
import com.gmail.mironchik.kos.web.model.converter.Converter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.*;
import java.util.Iterator;
import java.util.Set;

/**
 * Created by konstantin1 on 20.02.15.
 */
@Controller
@Scope(value = "session")
public class TestController {

    @Autowired
    SessionData sessionData;


    @Autowired
    TestRepository testRepository;

    @RequestMapping("/")
    public String showMain(Model model) {
        model.addAttribute("tests", testRepository.getAll());
        return "login";
    }

    @RequestMapping("/login")
    public @ResponseBody ResponseStatus doLogin(User user) {
        testRepository.save(Converter.convert(user));
        sessionData.setUser(user);
        return ResponseStatus.SUCCESS;
    }

    @RequestMapping("/logout")
    public String doLogout() {
        sessionData.setUser(null);
        sessionData.setTestResult(null);
        return "redirect:/";
    }

    @RequestMapping("/saveresults/{zoneOffset}")
    public
    @ResponseBody
    ResponseStatus saveResults(@PathVariable String zoneOffset) {
        TestResult sessionTestResult = sessionData.getTestResult();
        if (sessionTestResult != null) {
            testRepository.save(fillTestResultFromSession(sessionTestResult, sessionData.getUser(), zoneOffset));
        }
        return ResponseStatus.SUCCESS;
    }

    private com.gmail.mironchik.kos.web.model.TestResult fillTestResultFromSession(TestResult sessionTestResult, User sessionUser, String zoneOffset) {
        com.gmail.mironchik.kos.web.model.TestResult testResult = new com.gmail.mironchik.kos.web.model.TestResult();
        com.gmail.mironchik.kos.web.model.User user = new com.gmail.mironchik.kos.web.model.User();
        Test test = new Test();
        test.setId(sessionTestResult.getTestId());
        user.setProfileId(sessionUser.getProfileId());
        testResult.setUser(user);
        testResult.setTest(test);
        testResult.setFinishTime(LocalDateTime.now().atOffset(ZoneOffset.of(zoneOffset)).toLocalDateTime().toString());
        testResult.setScore(sessionTestResult.getScore());
        return testResult;
    }

    @RequestMapping(value = "/start", method = RequestMethod.POST)
    public
    @ResponseBody
    ResponseStatus getTest(TestResult testResult) {
        Test test = testRepository.getTestById(testResult.getTestId());
        sessionData.setTestResult(testResult);
        sessionData.getTestResult().setQuestions(test.getQuestions().stream().mapToLong(Question::getId).iterator());
        return ResponseStatus.SUCCESS;
    }

    @RequestMapping(value = "/calculatescore", method = RequestMethod.POST)
    public
    @ResponseBody
    ResponseStatus calculateScore(long[] answers) {
        sessionData.getTestResult().setScore(sessionData.getTestResult().getScore() +
                TestUtil.calculateScore(answers, sessionData.getTestResult().getCurrentQuestion().getAnswers()
                        .stream()
                        .filter(a -> a.isCorrect())
                        .mapToLong(Answer::getId).toArray()));

        return ResponseStatus.SUCCESS;
    }


    @RequestMapping("/nextquestion")
    public
    @ResponseBody
    com.gmail.mironchik.kos.web.dto.Question getNextQuestion() {
        Iterator iterator = sessionData.getTestResult().getQuestions();
        sessionData.getTestResult().setCurrentQuestion(iterator.hasNext()
                ? testRepository.getQuestionById((Long) iterator.next())
                : null);
        return new com.gmail.mironchik.kos.web.dto.Question(
                sessionData.getTestResult().getCurrentQuestion());
    }

    @RequestMapping("/currentquestion")
    public
    @ResponseBody
    com.gmail.mironchik.kos.web.dto.Question getCurrentQuestion() {
        return new com.gmail.mironchik.kos.web.dto.Question(
                sessionData.getTestResult().getCurrentQuestion());
    }

    @RequestMapping("/getresults")
    public
    @ResponseBody
    Set getResults() {
        return testRepository.getTestResultByUserName(sessionData.getUser().getProfileId());
    }

    @RequestMapping("/results")
    public String viewResults() {
        return sessionData.getUser() != null ? "result" : "redirect:/";
    }

    @RequestMapping("/isauthenticated")
    public @ResponseBody User isAuthenticated() {
        return sessionData.getUser() != null ? sessionData.getUser() : null;
    }
}

