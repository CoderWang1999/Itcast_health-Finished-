package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.Member;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MemberDao {
    //根据手机号查询会员
    Member findByTelephone(String telephone);
    //新增会员
    void add(Member member);
    //查询指定月份之前会员总数
    Integer findMemberCountBeforeDate(String month);
    //根据日期查询会员总数
    Integer findMemberCountByDate(String today);
    //获取会员总数
    Integer findMemberTotalCount();
    //获取指定日期之后的会员总数
    Integer findMemberCountAfterDate(String thisWeekMonday);
    void updateByOrder(@Param("name") String name, @Param("phoneNumber") String phoneNumber);
    //分页查询会员
    Page<Member> findPage(String queryString);
    //对健康管理师的回显
    List<String> findHealthManager();
    //新增
    void addMember(Member member);
    //会员的回显
    Member findMemberById(Integer memberId);
    //修改
    void editMember(Member member);

    void deleteMember(Integer id);

    //查询所有关联信息
    List<Map<String, Object>> findAllmessageById(Integer id);

    void update( @Param("id")Integer tempOrderId, @Param("healthName") String username);

    //修改order表中的健康管理师
    void updateOrderHealthName(@Param("id") Integer id,@Param("healthName") String healthmanager);
}
