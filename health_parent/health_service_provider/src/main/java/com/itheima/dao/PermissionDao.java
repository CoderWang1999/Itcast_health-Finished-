package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface PermissionDao {
    Set<Permission> findByRoleId(Integer rid);

    Page<Permission> findPage(String queryString);

    void add(Permission permission);

    Permission findByPmName2KeyWord(@Param("name") String name, @Param("keyword") String keyword);

    void edit(Permission permission);

    List<Role> findRolesByPmId(Integer id);

    void deleteConnection4roleByPmId(Integer id);

    void deleteByPmId(Integer id);

    Set<Permission> findAllPermission();

    List<Permission> findAllPermissionZF();
}
