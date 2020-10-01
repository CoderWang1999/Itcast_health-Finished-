package com.itheima.dao;

import com.itheima.pojo.Member;

public interface MemberDao {
    //根据手机号查询会员
    Member findByTelephone(String telephone);
    //新增会员
    void add(Member member);
    //查询指定月份之前会员总数
    Integer findMemberCountBeforeDate(String month);
}
