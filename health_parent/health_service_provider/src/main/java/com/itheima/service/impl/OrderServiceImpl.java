package com.itheima.service.impl;
import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.constant.MessageConstant;
import com.itheima.dao.MemberDao;
import com.itheima.dao.OrderDao;
import com.itheima.dao.OrderSettingDao;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;
import com.itheima.pojo.Order;
import com.itheima.pojo.OrderSetting;
import com.itheima.service.OrderService;
import com.itheima.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private OrderSettingDao orderSettingDao;
    @Autowired
    private MemberDao memberDao;
    //体检预约
    @Override
    public Result order(Map map) throws Exception{
        //1.检查用所选择的日期是否已经进行预约设置
        String orderDate= (String) map.get("orderDate");
        //把string类型的日期改为Date类型
        Date date = DateUtils.parseString2Date(orderDate);
        //根据日期查询预约设置
        OrderSetting orderSetting = orderSettingDao.findByOrderDate(date);
        //如果当天没有进行预约设置无法进行体检预约
        if (orderSetting==null){
            return new Result(false, MessageConstant.SELECTED_DATE_CANNOT_ORDER);
        }
        //2.检查用户选择的预约日期是否已被约满
        //获得可预约人数
        int number = orderSetting.getNumber();
        //获取已预约人数
        int reservations = orderSetting.getReservations();
        if (reservations>=number){
            //当天已被约满
            return new Result(false,MessageConstant.ORDER_FULL);
        }
        //3.检查该用户是否重复预约同一套餐
        //4、检查当前用户是否为会员，如果是会员则直接完成预约，如果不是会员则自动完成注册并进行预约
        //获取用户手机号
        String telephone = (String) map.get("telephone");
        //根据手机号查询会员信息
        Member member=memberDao.findByTelephone(telephone);
        //如果该用户是会员
        if (member!=null){
            //获取会员id
            Integer memberId = member.getId();
            //获取套餐id
            Integer setmealId= Integer.parseInt((String) map.get("setmealId"));
            Order order = new Order(memberId, date, setmealId);
            //根据条件查询
            List<Order> list = orderDao.findByCondition(order);
            if (list!=null&&list.size()>0){
                //到这说明在重复预约
                return new Result(false,MessageConstant.HAS_ORDERED);
            }
        }
        //如果用户不是会员则立即创建
        else {
            member = new Member();
            member.setName((String) map.get("name"));
            member.setPhoneNumber(telephone);
            member.setIdCard((String) map.get("idCard"));
            member.setSex((String) map.get("sex"));
            member.setRegTime(new Date());
            //自动完成会员注册
            memberDao.add(member);
        }
        //5.预约成功，更新当日的已预约人数
        Order order = new Order();
        //会员ID
        order.setMemberId(member.getId());
        //预约日期
        order.setOrderDate(date);
        //预约类型
        order.setOrderType((String) map.get("orderType"));
        //就诊状态
        order.setOrderStatus(Order.ORDERSTATUS_NO);
        //套餐ID
        order.setSetmealId(Integer.parseInt((String) map.get("setmealId")));
        //新增预约信息
        orderDao.add(order);
        //设置已预约人数+1
        orderSetting.setReservations(orderSetting.getReservations()+1);
        //根据预约日期修改已预约人数
        orderSettingDao.editReservationsByOrderDate(orderSetting);
        return new Result(true,MessageConstant.ORDER_SUCCESS,order.getId());
    }

    //根据id查询预约信息
    @Override
    public Map findById(Integer id) throws Exception {
        Map map=orderDao.findById4Detail(id);
        if (map!=null){
            //处理日期格式
            Date date = (Date) map.get("orderDate");
            String orderDate = DateUtils.parseDate2String(date);
            map.put("orderDate",orderDate);
        }
        return map;
    }
}
