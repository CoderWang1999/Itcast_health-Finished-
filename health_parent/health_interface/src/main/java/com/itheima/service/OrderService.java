package com.itheima.service;

import com.itheima.entity.Result;
import com.itheima.pojo.OrderSetting;

import java.util.List;
import java.util.Map;
public interface OrderService {
    //体检预约
    Result order(Map map) throws Exception;
    //根据id查询预约信息
    Map findById(Integer id) throws Exception;
}
