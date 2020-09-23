package com.itheima.service;

import com.itheima.pojo.OrderSetting;

import java.util.List;

public interface OrderSettingService {
    //存储时期和对应的最大预约人数
    void add(List<OrderSetting> orderSettings);
}
