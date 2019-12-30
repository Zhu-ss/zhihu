package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @ClassName UserServiceImpl
 * @Author
 * @Date 2019/11/26 20:22
 * @Version 1.0
 **/
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    private Logger log= LoggerFactory.getLogger(UserServiceImpl.class);

    @Transactional
    @Override
    public User login(User user) {
        User login = userDao.login(user);
        log.debug("进serviceImpl");
        if (login !=null) {
            return login;
        }
        return null;
    }

    @Override
    public boolean regist(User user) {
        boolean b = userDao.regist(user);
        if (b) {
            return b;
        }
        return false;
    }
}
