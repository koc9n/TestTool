package com.gmail.mironchik.kos.web.controller;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by koc9n on 04.03.15.
 */
public class TestUtil {
    public static float calculateScore(long[] answers, long[] rightAnswers) {
        float score = 0;
        if (answers == null) return score;
        if (rightAnswers.length == 1) {
            score = answers[0] == rightAnswers[0] ? 1 : 0;
        } else {
            if (answers.length >= 1) {
                AtomicInteger guessed = new AtomicInteger(0);
                Arrays.stream(rightAnswers).forEach(
                        ra -> Arrays.stream(answers)
                                .forEach(a -> {
                                    if (a == ra) guessed.getAndIncrement();
                                }));
                float missed = answers.length - guessed.get();
                float rightAnsLength = rightAnswers.length;
                score = guessed.get() <= missed ? 0 : (guessed.get() - missed) / rightAnsLength;
            }
        }
        return score;
    }
}
