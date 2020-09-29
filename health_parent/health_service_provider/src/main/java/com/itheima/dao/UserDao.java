package com.itheima.dao;

import com.itheima.pojo.User;

public interface UserDao {
    //根据用户名查询用户
    User findByUsername(String username);
}
