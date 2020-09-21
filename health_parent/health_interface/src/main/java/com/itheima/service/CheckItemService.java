package com.itheima.service;

import com.itheima.entity.CheckItemDeleteException;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.CheckItem;

import java.util.List;

public interface CheckItemService {
    //新增功能
    void add(CheckItem checkItem);
    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);
    //根据id删除
    void deltetByid(Integer id) throws CheckItemDeleteException;
    //编辑
    void edit(CheckItem checkItem);
    //不带分页的查询所有
    List<CheckItem> findAll();
}
