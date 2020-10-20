package com.itheima.service;

import com.itheima.entity.Conditions;
import com.itheima.entity.PageResult;
import com.itheima.entity.Result;
import com.itheima.pojo.Order;
import com.itheima.pojo.OrderSetting;

import java.util.List;
import java.util.Map;
public interface OrderService {
    //体检预约
    Result order(Map map) throws Exception;
    Result submit(Map dataMap);

    Map findById(Integer id) throws Exception;

    List<Order> findByMemberIdWithCondition(Integer memberId);

    List<Map> findAll4OrderAndSetmeal(Integer memberId);

    List<Map> findSetmealByIdAndDate(Integer memberId,String startDate, String endDate, String setmealName);

    Map findAllDataByOrderId(Integer orderId);

    //分页查询
    PageResult findByPageAndCondition(Conditions conditions);
    //编辑操作，先查询点击对象的id
    Map findOrderById(Integer id);
    //通过订单id查询套餐id
    List<Integer> findSetmealIdsByOrderId(Integer id);
    //新增预约
    Result addPhoneOrder(Map map) throws Exception;
    //保存编辑后的数据
    void edit(Integer setmealId, Map map);
    //删除预约
    void delete(Integer id);
    //修改预约状态
    void statusEdit(Integer id);

    /**
     * 根据订单id，返回干预信息
     * @param id  预约订单id值
     * @return  返回订单中的饮食 运动 建议 管理员 信息
     */
    Order findHealtMessageById(Integer id);

    /**
     * 修改就诊状态
     * @param orderStatusId  0:未就诊
     * @param orderId  预约订单id值
     */
    void statusEdit(Integer orderStatusId, Integer orderId);
}
