package com.itheima.service;



import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Setmeal;

import java.util.List;

public interface SetmealService {
    //新增
    void add(Setmeal setmeal, Integer[] checkgroupIds);
    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);
}
