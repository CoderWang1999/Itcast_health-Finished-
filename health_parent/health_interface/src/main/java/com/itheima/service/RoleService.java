package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Menu;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;
import com.itheima.pojo.User;

import java.util.List;
import java.util.Set;

public interface RoleService {


    PageResult findPage(QueryPageBean queryPageBean);

    Set<Permission> findAllPermission();

    Set<Menu> findAllMenus();

    List<Role> findByName2Kd(String name, String keyword);

    void add(Integer[] permissionIds, Integer[] menuIds, Role role);

    List<Integer> findPermissionIdByrid(Integer rId);

    List<Integer> findMenuIdByrid(Integer rId);

    void edit(Integer[] permissionIds, Integer[] menuIds, Role role);

    Role findById(Integer id);

    Set<Permission> findPmByrId(Integer id);

    Set<Menu> findMnByrId(Integer id);

    List<User> findUsById(Integer id);

    void deleterole(Integer id);
}
