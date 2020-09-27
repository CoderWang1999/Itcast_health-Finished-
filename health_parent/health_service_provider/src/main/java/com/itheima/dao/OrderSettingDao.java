package com.itheima.dao;


import com.itheima.pojo.OrderSetting;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface OrderSettingDao {
    //查询日期是否存在
    long findCountByOrderDate(Date orderDate);
    //添加预约设置数据
    void add(OrderSetting orderSetting);
    //根据日期修改可预约人数
    void undate(OrderSetting orderSetting);
    //根据月份查询预约数据
    List<OrderSetting> getOrderSettingByMonth(Map<String, String> map);
    //根据日期查询预约设置
    OrderSetting findByOrderDate(Date date);
    //根据日期修稿已预约人数
    void editReservationsByOrderDate(OrderSetting orderSetting);
}
