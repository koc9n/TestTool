package com.gmail.mironchik.kos.web.dao;

import com.gmail.mironchik.kos.web.model.Question;
import com.gmail.mironchik.kos.web.model.Test;
import com.gmail.mironchik.kos.web.model.TestResult;
import com.gmail.mironchik.kos.web.model.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by konstantin1 on 21.02.15.
 */
@Repository
public class TestRepository {

    @PersistenceContext
    EntityManager entityManager;

    @Transactional
    public List<Test> getAll() {
        return entityManager.createQuery("select t from Test t").getResultList();
    }

    @Transactional
    public Test getTestById(Long id) {
        return entityManager.createQuery("select t from Test t join fetch t.questions as q join fetch q.answers where t.id = :id", Test.class)
                .setParameter("id", id).getSingleResult();
    }

    @Transactional
    public Question getQuestionById(Long id) {
        return entityManager.createQuery("select q from Question q join fetch q.answers where q.id = :id", Question.class)
                .setParameter("id", id).getSingleResult();
    }

    @Transactional
    public void save(TestResult testResult) {
        Test test = getTestById(testResult.getTest().getId());
        User user = getUserByProfileId(testResult.getUser().getProfileId());


        if (user == null){
            entityManager.persist(testResult.getUser());
            user = getUserByProfileId(testResult.getUser().getProfileId());
        }

        testResult.setTest(test);
        testResult.setUser(user);

        entityManager.persist(testResult);
    }

    @Transactional
    public User getUserByProfileId(String profileId) {
        try {
            return entityManager.createQuery(
                    "select u from User u " +
                            "where u.profileId = :profileId", User.class)
                    .setParameter("profileId", profileId).getSingleResult();
        } catch (PersistenceException pe) {
            return null;
        }

    }
    @Transactional
    public Set getTestResultByUserName(String profileId) {
        return new HashSet<>(entityManager.createQuery(
                "select tr from TestResult tr " +
                        "where tr.user.profileId = :profileId", TestResult.class)
                .setParameter("profileId", profileId).getResultList());
    }

    @Transactional
    public void save(User user) {
        User existUser = getUserByProfileId(user.getProfileId());
        if (existUser == null){
            entityManager.persist(user);
        }
    }
}
