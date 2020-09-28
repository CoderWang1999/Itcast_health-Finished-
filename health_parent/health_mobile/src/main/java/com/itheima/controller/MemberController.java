package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.itheima.constant.MessageConstant;
import com.itheima.constant.RedisMessageConstant;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;
import com.itheima.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private JedisPool jedisPool;
    @Reference
    private MemberService memberService;
    //在线体检预约
    @RequestMapping("/login")
    public Result login(HttpServletResponse response, @RequestBody Map map){
        //获取前端输入的手机号
        String telephone = (String) map.get("telephone");
        //从Redis中获取验证码
        String codeFromRedis = jedisPool.getResource().get(telephone+ RedisMessageConstant.SENDTYPE_LOGIN);
        //获取移动端输入的验证码
        String validateCode = (String) map.get("validateCode");
        //校验验证码
        if (codeFromRedis!=null&&validateCode!=null&&codeFromRedis.equals(validateCode)){
            //校验成功
            //判断当前用户是否是会员
            Member member = memberService.findByTelephone(telephone);
            if (member==null){
                //不是会员，自动完成注册
                 member = new Member();
                 member.setRegTime(new Date());
                 member.setPhoneNumber(telephone);
                 memberService.add(member);
            }
            //向客户端浏览器写入cookie，内容为用户的手机号
            //创建cookie对象
            Cookie cookie = new Cookie("login_member_telephone", telephone);
            //设置路径
            cookie.setPath("/");
            //设置cookie存活时间(30天)
            cookie.setMaxAge(60*60*24*30);
            //写入客户端浏览器
            response.addCookie(cookie);
            //将会员信息保存到Redis服务器中
            //将会员信息转换成json字符串类型数据
            String json = JSON.toJSON(member).toString();
            //将json字符串类型数据存入Redis
            jedisPool.getResource().setex(telephone,60*30,json);
            return new Result(true,MessageConstant.LOGIN_SUCCESS);
        }else {
            //比对不成功
            return new Result(false, MessageConstant.VALIDATECODE_ERROR);
        }
    }
}
