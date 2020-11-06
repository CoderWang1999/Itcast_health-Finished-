package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;

public interface Intervention_controlDao {
    //分页查询
    Page<Member> selectIntervenByCondition(String queryString);
}
