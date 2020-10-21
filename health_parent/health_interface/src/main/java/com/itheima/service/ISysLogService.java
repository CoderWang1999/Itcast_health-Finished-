package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Syslog;

import java.text.ParseException;

public interface ISysLogService {
    public void saveLog(Syslog syslog); //保存日志

    PageResult findAll(QueryPageBean queryPageBean) throws ParseException;//查询所有日志

    void deleteById(String id);

    void deleteByIds(String[] id);
}
