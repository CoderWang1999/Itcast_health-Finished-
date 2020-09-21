package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.CheckItem;

import java.util.List;

public interface CheckItemDao {
    //插入
    void add(CheckItem checkItem);
    //查询所有
    Page<CheckItem> selectByCondition(String queryString);
    //查询有无关联关系
    long findCountCheckItemID(Integer id);
    //根据id删除
    void deltetByid(Integer id);
    //编辑
    void edit(CheckItem checkItem);
    //不带分页的查询所有
    List<CheckItem> findAll();
}
