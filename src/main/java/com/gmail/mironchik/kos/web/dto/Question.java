package com.gmail.mironchik.kos.web.dto;

/**
 * Created by konstantin1 on 25.02.15.
 */

public class Question {
    private com.gmail.mironchik.kos.web.model.Question next;

    public Question(com.gmail.mironchik.kos.web.model.Question next) {
        this.next = next;
    }

    public com.gmail.mironchik.kos.web.model.Question getNext() {
        return next;
    }

    public void setNext(com.gmail.mironchik.kos.web.model.Question next) {
        this.next = next;
    }
}
