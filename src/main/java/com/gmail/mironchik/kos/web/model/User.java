package com.gmail.mironchik.kos.web.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by konstantin1 on 22.02.15.
 */
@Entity
@Table(name = "user")
public class User {
    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String profileId;
    @JsonIgnore
    @OneToMany(mappedBy = "user")
    private Set<TestResult> testResults;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    public Set getTestResults() {
        return testResults;
    }

    public void setTestResults(Set testResults) {
        this.testResults = testResults;
    }
}
