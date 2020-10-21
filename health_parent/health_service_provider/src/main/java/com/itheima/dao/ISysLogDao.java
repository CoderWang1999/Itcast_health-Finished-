package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.Syslog;

import java.util.List;

public interface ISysLogDao {

    void insert(Syslog syslog);

    Page<Syslog> selectAll(String queryString);

    void deleteById(String id);
}