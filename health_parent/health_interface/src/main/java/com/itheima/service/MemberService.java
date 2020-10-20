package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;

import java.util.List;
import java.util.Map;

public interface MemberService {
    //根据手机号查询会员
    Member findByTelephone(String telephone);
    //新增会员
    void add(Member member);
    //根据月份查询会员数量
    List<Integer> findMemberCountByMonths(List<String> months);
    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);
    //查询健康管理师
    List<Map<String, Object>> findHealthManager();
    //添加会员
    void addMember(Member member);
    //根据id查询会员
    Member findMemberById(Integer memberId);
    //修改会员
    void editMember(Member member);
    //删除会员
    Result deleteMember(Integer id);
    //根据会员id查询所有关联信息
    List<String> findAllmessageById(Integer id);
}
