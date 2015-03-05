package com.gmail.mironchik.kos.web.controller;

import com.gmail.mironchik.kos.web.dto.TestResult;
import com.gmail.mironchik.kos.web.dto.User;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * Created by koc9n on 04.03.15.
 */
@Component
@Scope(value = "session")
public class SessionData {
    private User user;
    private TestResult testResult;

    public TestResult getTestResult() {
        return testResult;
    }

    public void setTestResult(TestResult testResult) {
        this.testResult = testResult;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
