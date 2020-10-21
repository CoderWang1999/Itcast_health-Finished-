package com.itheima.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ReportDao {
    /**
     * 查询已预约的套餐的名称和对应的已预约的套餐的数量
     * @return
     */
    Integer findOrderByMonth(String date);

    Integer findArriveByMonth(String date2String);

    List<Map> findSetmealMoney();

}
