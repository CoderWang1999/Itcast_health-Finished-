package com.itheima.service;



import com.itheima.pojo.Setmeal;

import java.util.List;

public interface SetmealService {
    //新增
    void add(Setmeal setmeal, Integer[] checkgroupIds);
}
