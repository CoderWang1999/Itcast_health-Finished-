package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //根据用户名查询用户
    User findByUsername(String username);
    Page<User> findPage(String queryString);

    void add(User user);

    void addRoleIdAndUser(@Param("lastId") Integer lastId, @Param("roleId") Integer roleId);

    void update(User user);

    void deleteConnection4roleByUid(Integer uid);

    List<Integer> findRoleIdByUid(Integer uid);

    void deleteUser(Integer id);


    List<User> findUsByrId(Integer id);

    User findById(Integer id);
}
