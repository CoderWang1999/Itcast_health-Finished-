package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Menu;
import com.itheima.pojo.Role;

import java.util.List;
import java.util.Map;

public interface MenuService {


    PageResult findPage(QueryPageBean queryPageBean);

    List<Map<String, Integer>> findAllMenu();

    List<Menu> findByNameAndLkurl(String name, String linkUrl);

    void add(Menu menu);

    Menu findById(Integer id);

    void edit(Menu menu);

    List<Role> findRoleBymid(Integer id);

    Menu findmenuById(Integer id);

    void delete(Integer id);
}
