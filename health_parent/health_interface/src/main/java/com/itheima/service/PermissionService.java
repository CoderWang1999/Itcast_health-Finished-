package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;

import java.util.List;

public interface PermissionService {

    PageResult findPage(QueryPageBean queryPageBean);

    void add(Permission permission);

    Permission findByPmName2KeyWord(String name, String keyword);

    void edit(Permission permission);

    List<Role> findRolesByPmId(Integer id);

    void delete(Integer id);

    List<Permission> findAllPermissionZF();
}
