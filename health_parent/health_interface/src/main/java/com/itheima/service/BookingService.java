package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;

public interface BookingService {
    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);

}
