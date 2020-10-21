package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;
import com.itheima.pojo.Address;
import com.itheima.service.AddressService;
import com.itheima.service.OrderService;
import com.itheima.service.SetmealService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Reference
    private OrderService orderService;
    @Reference
    private AddressService addressService;

    @Reference
    private SetmealService setMealService;

    @RequestMapping("/submit")
    public Result submit(@RequestBody Map dataMap) {
        try {
            return orderService.submit(dataMap);
        } catch (Exception e) {
            e.printStackTrace();
            //返回一个合适的预约失败信息
            return new Result(false, "预约失败");
        }
    }

    @RequestMapping("/findById")
    public Result findById(Integer id) {
        try {
            Map dataMap = orderService.findById(id);
            return new Result(true, MessageConstant.QUERY_ORDER_SUCCESS, dataMap);
        } catch (Exception e) {
            return new Result(false, MessageConstant.QUERY_ORDER_FAIL);
        }
    }

    /**
     * 查询全部地址信息
     * @return
     */
    @RequestMapping("/findAll")
    public Result findAll(){
        try{
            List<Address> address = addressService.findAll();
            return  new Result(true, MessageConstant.GET_ADDRESS_SUCCESS,address);
        }catch (Exception e){
            e.printStackTrace();
            //服务调用失败
            return new Result(false, MessageConstant.GET_ADDRESS_FAIL);
        }
    }


    /**
     * 查询该会员所有的订单,以及每一个订单对应的套餐
     * @param request 获取存储在session中的会员信息
     * @return
     */
    @RequestMapping("/findAll4OrderAndSetmeal")
    public Result findAll4OrderAndSetmeal(HttpServletRequest request) {
        try {
            //获取存储在session中的会员信息
            Member member = (Member) request.getSession().getAttribute("MemberMessage");

            //获取该会员的id
            Integer memberId = member.getId();

            //查询出该会员对应的预约，按照已到诊未到诊分类，按照时间排序
            //查询出每一个预约对应的套餐
            //把所以的信息封装进集合
           List<Map> dataMap=orderService.findAll4OrderAndSetmeal(memberId);

            //把查询出的结果返回给前端
            return new Result(true, "查询成功", dataMap);
        } catch (Exception e) {
            return new Result(false, "服务器异常");
        }
    }

    /**
     * 条件查询
     * @param map 查询条件 起始日期 结束日期  套餐名称
     * @param request 用于获取存储在session中的会员id
     * @return
     */
    @RequestMapping("/findSetmealByIdAndDate")
    public Result findSetmealByIdAndDate(@RequestBody Map map,HttpServletRequest request) {
        try {
            //开始日期，如果开始日期为空，那么开始日期默认1970...
            String startDate = (String) map.get("startDate");
            if (startDate == null||startDate.length()==0) {
                startDate = "1970-01-01";
            }

            //截止日期，如果截止日期为空，那么截止日期默认今天
            String endDate = (String) map.get("endDate");
            if (endDate == null || endDate.length() == 0) {
                endDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            }

            //获取存储在session中的会员信息
            Member member = (Member) request.getSession().getAttribute("MemberMessage");

            //获取该会员的id
            Integer memberId = member.getId();

            //套餐名称
            String setmealName = (String) map.get("setmealName");

            List<Map> dataMap=orderService.findSetmealByIdAndDate(memberId,startDate,endDate,setmealName);

            //把结果和提示信息返回给前端
            return new Result(true, "查询成功", dataMap);
        } catch (Exception e) {
            //打印异常信息
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }

    /**
     * @param orderId 前端传来的orderId
     * @return
     */
    @RequestMapping("/findAllDataByOrderId")
    public Result findAllDataByOrderId(Integer orderId) {
        try {
            Map dataMap = orderService.findAllDataByOrderId(orderId);

            //查询成功，向前端返回数据
            return new Result(true, "查询成功", dataMap);
        } catch (Exception e) {
            //打印异常信息
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }
}
