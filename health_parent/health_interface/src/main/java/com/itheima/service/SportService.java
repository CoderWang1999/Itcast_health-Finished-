package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Sport;

import java.util.List;

public interface SportService {
    PageResult findPage(QueryPageBean queryPageBean);

    void add(Sport sport);

    Sport findById(Integer id);

    void edit(Sport sport);

    void delete(Integer id);

    List<Sport> findAll();

    void save(List<Sport> sports);
}
