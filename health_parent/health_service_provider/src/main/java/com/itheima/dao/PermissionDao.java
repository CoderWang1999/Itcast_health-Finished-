package com.itheima.dao;

import com.itheima.pojo.Permission;

import java.util.Set;

public interface PermissionDao {
    //根据角色id查询权限
    Set<Permission> findByRoleId(Integer roleId);
}
