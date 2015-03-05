package com.gmail.mironchik.kos.web.model.converter;

import com.gmail.mironchik.kos.web.model.User;

/**
 * Created by koc9n on 05.03.15.
 */
public class Converter {
    public static User convert (com.gmail.mironchik.kos.web.dto.User user){
        User dbUser = new User();
        dbUser.setName(user.getName());
        dbUser.setProfileId(user.getProfileId());
        return dbUser;
    }
}
