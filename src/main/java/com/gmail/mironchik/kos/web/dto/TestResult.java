package com.gmail.mironchik.kos.web.dto;

import java.util.Iterator;

/**
 * Created by konstantin1 on 24.02.15.
 */
public class TestResult {
    private float score;
    private Long testId;
    private Iterator questions;
    private com.gmail.mironchik.kos.web.model.Question currentQuestion;

    public TestResult() {
    }

    public TestResult(Long testId) {
        this.testId = testId;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public Long getTestId() {
        return testId;
    }

    public void setTestId(Long testId) {
        this.testId = testId;
    }

    public Iterator getQuestions() {
        return questions;
    }

    public void setQuestions(Iterator questions) {
        this.questions = questions;
    }

    public com.gmail.mironchik.kos.web.model.Question getCurrentQuestion() {
        return currentQuestion;
    }

    public void setCurrentQuestion(com.gmail.mironchik.kos.web.model.Question currentQuestion) {
        this.currentQuestion = currentQuestion;
    }
}
