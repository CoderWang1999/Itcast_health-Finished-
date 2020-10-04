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
    //根据日期查询预约人数
    Integer findOrderCountByDate(String today);
    //查询指定日期之后的预约人数
    Integer findOrderCountAfterDate(String thisWeekMonday);
    //根据日期查询就诊人数
    Integer findVisitsCountByDate(String today);
    //查询指定日期之后的就诊人数
    Integer findVisitsCountAfterDate(String thisWeekMonday);
    //热门套餐查询
    List<Map> findHotSetmeal();
}
