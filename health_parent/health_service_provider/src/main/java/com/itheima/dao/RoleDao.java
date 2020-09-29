package com.itheima.dao;

import com.itheima.pojo.Role;

import java.util.Set;

public interface RoleDao {
    //根据用户id查询用户角色
    Set<Role> findByUserId(Integer userId);
}
