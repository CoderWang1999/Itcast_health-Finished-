package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.service.BookingService;
import com.itheima.service.OrderService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 后台预约管理 -后台预约信息管理
 */
@RestController
@RequestMapping("/booking")
public class BookingController {
    @Reference
    private BookingService bookingService;
    @Reference
    private OrderService orderService;

    /**
     * 分页查询
     * @param queryPageBean 前端的数据信息
     * @return  返回查询结果 和分页的数据
     */
    @RequestMapping("/findPage")
    public Result findPage(@RequestBody QueryPageBean queryPageBean) {
        try {
            //查询成功
            PageResult pageResult = bookingService.findPage(queryPageBean);
            return new Result(true, "分页查询成功", pageResult);
        } catch (Exception e) {
            //失败给出提示信息
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }


    /**
     * 改变就诊状态 未就诊 可以改变状态 ，已就诊就不可以改变状态
     * @param orderStatusId  0:表示由未到诊 变成已到诊
     * @param orderId  预约订单id值
     * @return  返回改变就诊状态的信息
     */
    @RequestMapping("/statusEdit")
    public Result statusEdit(Integer orderStatusId,Integer orderId) {
        try {
            orderService.statusEdit(orderStatusId,orderId);
            return new Result(true, "更改就诊状态成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "更改就诊状态失败");
        }
    }
}
