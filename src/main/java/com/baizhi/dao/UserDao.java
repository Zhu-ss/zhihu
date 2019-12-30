package com.baizhi.dao;

import com.baizhi.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    User login(User user);

    boolean regist(User user);
}
