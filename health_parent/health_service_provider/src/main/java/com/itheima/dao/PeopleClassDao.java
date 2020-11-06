package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.PeopleClass;

public interface PeopleClassDao {
    Page<PeopleClass> selectByCondition(String queryString);
}
