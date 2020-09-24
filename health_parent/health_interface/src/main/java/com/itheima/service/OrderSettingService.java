package com.itheima.service;

import com.itheima.pojo.OrderSetting;

import java.util.List;
import java.util.Map;

public interface OrderSettingService {
    //存储时期和对应的最大预约人数
    void add(List<OrderSetting> orderSettings);
    //根据月份查询预约数据
    List<Map> getOrderSettingByMonth(String date);
    //根据日期修改预约信息
    void editOrderSettingByDate(OrderSetting orderSetting);
}
