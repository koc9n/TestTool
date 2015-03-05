package com.gmail.mironchik.kos.web.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by konstantin1 on 21.02.15.
 */
@Entity
@Table(name = "question")
public class Question {
    @Id
    @Column(name = "question_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String content;
    private boolean isMultipleAnswers;
    @OneToMany(mappedBy = "question")
    private Set<Answer> answers;
    @JsonIgnore
    @ManyToOne()
    @JoinColumn(name = "test_id")
    private Test test;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isMultipleAnswers() {
        return isMultipleAnswers;
    }

    public void setMultipleAnswers(boolean isMultipleAnswers) {
        this.isMultipleAnswers = isMultipleAnswers;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }
}
