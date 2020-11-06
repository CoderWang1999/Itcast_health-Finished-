package com.itheima.dao;


import com.github.pagehelper.Page;
import com.itheima.pojo.Food;
import com.itheima.pojo.Scheme;

public interface SchemeDao {
    Page<Scheme> selectByCondition(String queryString);

    void add(Scheme scheme);

    Scheme findById(Integer id);

    void edit(Scheme scheme);

    void delete(Integer id);
}
