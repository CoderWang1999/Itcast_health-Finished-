package com.itheima.dao;

import com.itheima.pojo.Order;

import java.util.List;
import java.util.Map;

public interface OrderDao {
    //根据条件查询
    List<Order> findByCondition(Order order);
    //新增
    void add(Order order);
    //根据查询预约信息
    Map findById4Detail(Integer id);
}
