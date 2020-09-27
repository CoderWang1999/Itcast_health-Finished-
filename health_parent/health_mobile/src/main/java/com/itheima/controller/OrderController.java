package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.constant.RedisMessageConstant;
import com.itheima.entity.Result;
import com.itheima.pojo.Order;
import com.itheima.service.OrderService;
import com.itheima.utils.DateUtils;
import com.itheima.utils.SMSUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisPool;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private JedisPool jedisPool;
    @Reference
    private OrderService orderService;
    //在线体检预约
    @RequestMapping("/submit")
    public Result submit(@RequestBody Map map){
        //获取前端输入的手机号
        String telephone = (String) map.get("telephone");
        //从Redis中获取验证码
        String codeFromRedis = jedisPool.getResource().get(telephone+ RedisMessageConstant.SENDTYPE_ORDER);
        //获取移动端输入的验证码
        String validateCode = (String) map.get("validateCode");
        //校验验证码
        if (codeFromRedis!=null&&validateCode!=null&&codeFromRedis.equals(validateCode)){
            //如果校验成功，进行完成预约业务处理
            //微信预约
            map.put("orderType", Order.ORDERTYPE_WEIXIN);
            Result result=null;
            try{
                result=orderService.order(map);
            }catch (Exception e){
                e.printStackTrace();
                return result;
            }
            if (result.isFlag()){
                //预约成功，短信提醒用户
                try {
                    Date date = DateUtils.parseString2Date((String) map.get("orderDate"));
                    SMSUtils.sendShortMessage2(SMSUtils.ORDER_NOTICE,telephone,date);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            return result;
        }else {
            //比对不成功
            return new Result(false, MessageConstant.VALIDATECODE_ERROR);
        }
    }
    //根据id查询预约信息
    @RequestMapping("/findById")
    public Result findById(Integer id) throws Exception {
        try {
            Map map = orderService.findById(id);
            return new Result(true,MessageConstant.QUERY_ORDER_SUCCESS,map);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,MessageConstant.QUERY_ORDER_FAIL);
        }
    }
}
