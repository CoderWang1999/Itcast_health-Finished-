package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Menu;
import com.itheima.pojo.Role;
import com.itheima.pojo.User;

import java.util.LinkedHashSet;
import java.util.List;

public interface UserService {
    //根据用户名查询用户
    User findByUsername(String username);
    PageResult findPage(QueryPageBean queryPageBean);

    List<Role> findAllRoles();

    void add(Integer[] roleIds, User user);

    void edit(Integer[] roleIds, User user);

    List<Integer> findRoleIdByUid(Integer uId);

    void delete(User user);

    LinkedHashSet<Menu> getAllMenusById(Integer id);

    void upload(User user);

    User findById(Integer id);

    void editUser(User user);
}
