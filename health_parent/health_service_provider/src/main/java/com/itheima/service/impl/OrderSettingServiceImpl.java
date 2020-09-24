package com.itheima.service.impl;
import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.dao.OrderSettingDao;
import com.itheima.pojo.OrderSetting;
import com.itheima.service.OrderSettingService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderSettingServiceImpl implements OrderSettingService {
    @Autowired
    private OrderSettingDao orderSettingDao;

    //存储时期和对应的最大预约人数
    @Override
    public void add(List<OrderSetting> orderSettings) {
        if (orderSettings != null && orderSettings.size() > 0) {
            //判断数据库中是否已经存在当天的日期
            for (OrderSetting orderSetting : orderSettings) {
                long count = orderSettingDao.findCountByOrderDate(orderSetting.getOrderDate());
                if (count > 0) {
                    //已经进行了预约设计-执行更新操作
                    orderSettingDao.undate(orderSetting);
                } else {
                    //还没进行预约设计-执行新增操作
                    orderSettingDao.add(orderSetting);
                }
            }
        }
    }

    //根据月份查询预约数据
    @Override
    public List<Map> getOrderSettingByMonth(String date) {
        //每月第一天
        String begain=date+"-1";
        //每月最后一天（假设每月都有31号）
        String end=date+"-31";
        Map<String,String> map=new HashMap<>();
        map.put("begain",begain);
        map.put("end",end);
        List<OrderSetting> orderSettings = orderSettingDao.getOrderSettingByMonth(map);
        List<Map> result=new ArrayList<>();
        if (orderSettings!=null&&orderSettings.size()>0){
            for (OrderSetting orderSetting : orderSettings) {
                Map<String,Object> data=new HashMap<>();
                data.put("date",orderSetting.getOrderDate().getDate());
                data.put("number",orderSetting.getNumber());
                data.put("reservations",orderSetting.getReservations());
                result.add(data);
            }
        }
        return result;
    }

    //根据日期修改预约信息
    @Override
    public void editOrderSettingByDate(OrderSetting orderSetting) {
        //判断当前日期是否已设置预约信息
        long count = orderSettingDao.findCountByOrderDate(orderSetting.getOrderDate());
        if (count>0){
            //如果已经设置，则进行修改操作
            orderSettingDao.undate(orderSetting);
        }
        else {
            //还没进行预约设计-执行新增操作
            orderSettingDao.add(orderSetting);
        }
    }
}
