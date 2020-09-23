package com.itheima.service.impl;
import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.dao.OrderSettingDao;
import com.itheima.pojo.OrderSetting;
import com.itheima.service.OrderSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

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
}
