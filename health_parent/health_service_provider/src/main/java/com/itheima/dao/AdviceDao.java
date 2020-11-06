package com.itheima.dao;

import com.itheima.pojo.Order;

public interface AdviceDao {
    //干预信息的添加（根据预约表id 添加建议、饮食、 运动、 管理师）
    void update(Order order);
}
