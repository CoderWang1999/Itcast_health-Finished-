package com.itheima.dao;

import com.github.pagehelper.Page;
import com.itheima.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface OrderDao {
    public void add(Order order);

    public List<Order> findByCondition(Order order);

    public Map findById4Detail(Integer id);

    public Integer findOrderCountByDate(String date);

    public Integer findOrderCountAfterDate(String date);

    public Integer findVisitsCountByDate(String date);

    public Integer findVisitsCountAfterDate(String date);

    public List<Map> findHotSetmeal();

    List<Order> findByMemberIdWithCondition(Integer memberId);


    List<Order> findOrderById(Integer id);

    List<Map> findAll4OrderAndSetmeal(Integer memberId);

    List<Map> findSetmealByIdAndDate(@Param("memberId") Integer memberId, @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("setmealName") String setmealName);

    List<Map> findSetmealByIdAndDateWithoutName(@Param("memberId") Integer memberId, @Param("startDate") String startDate, @Param("endDate") String endDate);

    Map findAllDataByOrderId(Integer orderId);
    //分页查询
    Page findByPageAndCondition(@Param("queryString") String queryString, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("queryOrderStatus") String queryOrderStatus, @Param("queryOrderType") String queryOrderType);
    //编辑操作，先查询点击对象的id
    Map findOrderById1(Integer id);
    //通过订单id查询套餐id
    List<Integer> findSetmealIdsByOrderId(Integer id);
    //删除预约
    void delete(Integer id);
    //编辑预约
    void update(Order order);
    //查询就诊状态
    Order findOrderStatesById(Integer id);
    //改为未到诊
    void editStatus(Integer id);
    //改为已到诊
    void editStatusTo(Integer id);



    Order findHealtMessageById(Integer id);

    void update1(@Param("orderStatus") String orderStatus, @Param("id") Integer orderId);
}
