package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.Setmeal;

import java.util.List;
import java.util.Map;

public interface SetmealDao {
    //新增套餐
    void addSetmeal(Setmeal setmeal);
    //新增关联关系
    void setSetmealIdAndCheckGroupId(Map map);
    //分页查询
    Page<Setmeal> selectByCondition(String queryString);
    //查询所有套餐
    List<Setmeal> findAll();
    //根据id查询
    Setmeal findById(int id);
}