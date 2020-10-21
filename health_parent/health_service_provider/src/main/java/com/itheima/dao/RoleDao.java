package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.Menu;
import com.itheima.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public interface RoleDao {
     Set<Role> findByUserId(Integer userId);

    List<Role> findAllRoles();

    Page<Role> findPage(String queryString);


    List<Role> findByName2Kd(@Param("name") String name, @Param("keyword") String keyword);

    void add(Role role);

    void addPermissionAndRole(@Param("roleId") Integer roleId, @Param("permissionId") Integer permissionId);

    void addMenuAndRole(@Param("roleId") Integer roleId, @Param("menuId") Integer menuId);

    List<Integer> findPermissionIdByrid(Integer rId);

    List<Integer> findMenuIdByrid(Integer rId);

    void update(Role role);

    void deleteConnection4PermissionByrid(Integer roleId);

    void deleteConnection4MenuByrid(Integer roleId);

    Role findById(Integer id);

    void deleteConnection4UserByrid(Integer id);

    void deleterole(Integer id);

    List<Role> findRoleBymid(Integer id);

    LinkedHashSet<Menu> findMenuByRoleId(Integer roleId);
}
