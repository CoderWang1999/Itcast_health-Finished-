package com.itheima.service;


public interface AdviceService {
    //添加干预信息 饮食 运动 建议 健康管理师
    void add(Integer tempOrderId, String[] foodIds, String[] sportIds, String username, String suggestion);
}
