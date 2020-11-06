package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Scheme;

public interface SchemeService {
    PageResult findPage(QueryPageBean queryPageBean);

    void add(Scheme scheme);

    Scheme findById(Integer id);

    void edit(Scheme scheme);

    void delete(Integer id);
}
