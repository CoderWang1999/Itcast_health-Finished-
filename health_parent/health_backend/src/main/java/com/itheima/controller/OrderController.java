package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.entity.Conditions;
import com.itheima.entity.PageResult;
import com.itheima.entity.Result;
import com.itheima.pojo.Order;
import com.itheima.service.OrderService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Reference
    private OrderService orderService;


    //分页查询
    @RequestMapping("/findByPageAndCondition")
    public Result findByPageAndCondition(@RequestBody Conditions conditions) {
        PageResult result = orderService.findByPageAndCondition(conditions);
        return new Result(true, "查询成功", result);
    }

    //编辑操作，先查询点击对象的id
    @RequestMapping("/findOrderById")
    public Result findOrderById(Integer id) {
        try {
            Map map = orderService.findOrderById(id);
            return new Result(true, "查询成功", map);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }

    //通过订单id查询套餐idq
    @RequestMapping("/findSetmealIdsByOrderId")
    public Result findSetmealIdsByOrderId(Integer id) {
        try {
            List<Integer> setmealIds = orderService.findSetmealIdsByOrderId(id);
            return new Result(true, "查询成功", setmealIds);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }

    //保存编辑后的数据
    @RequestMapping("/edit")
    public Result edit(Integer setmealId, @RequestBody Map map) {
        try {
            orderService.edit(setmealId, map);
            return new Result(true, "编辑成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "编辑失败");
        }
    }


    //删除预约
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            orderService.delete(id);
            return new Result(true, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除失败");
        }
    }

    //新增预约
    @RequestMapping("/addPhoneOrder")
    public Result addPhoneOrder(@RequestBody Map map) throws Exception{
        map.put("orderType", Order.ORDERTYPE_TELEPHONE);
            return orderService.addPhoneOrder(map);
    }

    //修改预约状态
    @RequestMapping("/statusEdit")
    public Result statusEdit(Integer id) {
        try {
            orderService.statusEdit(id);
            return new Result(true, "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "修改失败");
        }
    }
}
