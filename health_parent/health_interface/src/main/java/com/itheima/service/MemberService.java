package com.itheima.service;

import com.itheima.pojo.Member;

import java.util.List;

public interface MemberService {
    //根据手机号查询会员
    Member findByTelephone(String telephone);
    //新增会员
    void add(Member member);
    //根据月份查询会员数量
    List<Integer> findMemberCountByMonths(List<String> months);
}
