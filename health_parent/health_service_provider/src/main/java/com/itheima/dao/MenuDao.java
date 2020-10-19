package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public interface MenuDao {

    Set<Menu> findAllMenus();


    Set<Menu> findByRole(Integer id);

    Page<Menu> findPage(String queryString);

    List<Map<String, Integer>> findMenus();

    List<Menu> findByNameAndLkurl(@Param("name") String name, @Param("linkUrl") String linkUrl);

    void add(Menu menu);

    Menu findById(Integer id);

    void edit(Menu menu);


    void delete(Integer id);

    List<Menu> findByParentId(Integer id);

    void deleteConnection4RoleBymid(Integer id);

    LinkedHashSet<Menu> findAllFistMenusById(Integer id);

    List<Menu> findSecondMenusByMenuId(@Param("id") Integer id, @Param("menuId") Integer menuId);
}
