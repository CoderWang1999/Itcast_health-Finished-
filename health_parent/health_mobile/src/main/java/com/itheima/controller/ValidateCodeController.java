package com.itheima.controller;

import com.itheima.constant.MessageConstant;
import com.itheima.constant.RedisMessageConstant;
import com.itheima.entity.Result;
import com.itheima.utils.SMSUtils;
import com.itheima.utils.SendEmailUtils;
import com.itheima.utils.ValidateCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@RestController
@RequestMapping("/validateCode")
public class ValidateCodeController {
    @Autowired
    private JedisPool jedisPool;

    @RequestMapping("/send4Order")
    public Result send4Order(String telephone) {
        Jedis resource = jedisPool.getResource();

        try {
            //生成四位数的验证码
            Integer validateCode = ValidateCodeUtils.generateValidateCode(4);

            //发送短信
            SMSUtils.sendShortMessage(SMSUtils.VALIDATE_CODE,telephone,validateCode.toString());

            //把验证码存入redis数据库中
            //存储时间是5分钟
            resource.setex(telephone + RedisMessageConstant.SENDTYPE_ORDER, 300, validateCode.toString());

            return new Result(true, MessageConstant.SEND_VALIDATECODE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.SEND_VALIDATECODE_FAIL);
        }finally {
            //释放资源
            if (resource != null) {
                resource.close();
            }
        }
    }

    @RequestMapping("/send4Login")
    public Result send4Login(String telephone) {
        Jedis resource = jedisPool.getResource();

        try {
            //生成六位数的验证码
            Integer validateCode = ValidateCodeUtils.generateValidateCode(6);

            //发送短信
            SMSUtils.sendShortMessage(SMSUtils.VALIDATE_CODE,telephone,validateCode.toString());

            //把验证码存入redis数据库中
            //存储时间是5分钟
            resource.setex(telephone + RedisMessageConstant.SENDTYPE_LOGIN, 300, validateCode.toString());

            return new Result(true, MessageConstant.SEND_VALIDATECODE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.SEND_VALIDATECODE_FAIL);
        }finally {
            //释放资源
            if (resource != null) {
                resource.close();
            }
        }
    }

    /**
     * 向邮箱中发送六位数的验证码
     * @param oldEmail 被发送验证码的邮箱
     * @return
     */
    @RequestMapping("/send4EditEmail")
    public Result send4EditEmail(String oldEmail) {
        Jedis resource = jedisPool.getResource();

        try {
            //生成一个六位数的验证码
            Integer validateCode = ValidateCodeUtils.generateValidateCode(6);

            //向redis数据库中存入这个验证码，时间为5分钟
            resource.setex(oldEmail + RedisMessageConstant.SENDTYPE_EDITEMAIL, 300, validateCode.toString());

            //向指定的邮箱中发送这个验证码
            SendEmailUtils.sendEmail4ValidateCode(oldEmail,validateCode+"");

            return new Result(true, "向" + oldEmail + "发送验证码成功,时效五分钟");
        } catch (Exception e) {
            //打印异常信息
            e.printStackTrace();
            return new Result(false, "向" + oldEmail + "发送验证码失败");
        }finally {
            //归还redis的连接
            if (resource != null) {
                resource.close();
            }
        }
    }

    /**
     * 校验修改邮箱的时候用户输入的验证码是否正确
     * @param validateCode 用户输入的验证码
     * @param oldEmail 指定的邮箱
     * @return
     */
    @RequestMapping("/checkValidateCodeForEditEmail")
    public Result checkValidateCodeForEditEmail(String validateCode,String oldEmail) {
        Jedis resource = jedisPool.getResource();

        try {
            //取出存储在数据库中的该邮箱的验证码
            String preValidateCode=resource.get(oldEmail + RedisMessageConstant.SENDTYPE_EDITEMAIL);

            //比较两次验证码是否相同
            if (validateCode != null && validateCode.equals(preValidateCode)) {
                //两次输入的验证码相同
                //向前端返回数据，前端不用提示信息直接进行下一步
                return new Result(true, "");
            } else {
                //两次输入的验证码不相同
                return new Result(false, "验证码输入有误或时间超时");
            }
        } catch (Exception e) {
            //打印异常信息
            e.printStackTrace();
            return new Result(false, "服务器异常,请联系管理员");
        }finally {
            //归还redis连接池的资源
            if (resource != null) {
                resource.close();
            }
        }
    }

    /**
     * 向前端传来的手机号发送六位数的验证码
     * @param oldPhoneNumber 被发送验证码的手机号
     * @return
     */
    @RequestMapping("/send4EditPhoneNumber")
    public Result send4EditPhoneNumber(String oldPhoneNumber) {
        Jedis resource = jedisPool.getResource();

        try {
            //生成一个六位数的验证码
            Integer validateCode = ValidateCodeUtils.generateValidateCode(6);

            //向redis数据库中存入这个验证码，时间为5分钟
            resource.setex(oldPhoneNumber + RedisMessageConstant.SENDTYPE_EDITPHONENUMBER, 300, validateCode.toString());

            //向指定的手机号发送这个验证码
            SMSUtils.sendShortMessage(SMSUtils.VALIDATE_CODE,oldPhoneNumber,validateCode.toString());

            return new Result(true, "向" + oldPhoneNumber + "发送验证码成功,时效五分钟");
        } catch (Exception e) {
            //打印异常信息
            e.printStackTrace();
            return new Result(false, "向" + oldPhoneNumber + "发送验证码失败");
        }finally {
            //归还redis的连接
            if (resource != null) {
                resource.close();
            }
        }
    }

    /**
     * 校验修改手机号的时候用户输入的验证码是否正确
     * @param validateCode 用户输入的验证码
     * @param oldPhoneNumber 指定的手机号
     * @return
     */
    @RequestMapping("/checkValidateCodeForEditPhoneNumber")
    public Result checkValidateCodeForEditPhoneNumber(String validateCode,String oldPhoneNumber) {
        Jedis resource = jedisPool.getResource();

        try {
            //取出存储在数据库中的该手机号的验证码
            String preValidateCode=resource.get(oldPhoneNumber + RedisMessageConstant.SENDTYPE_EDITPHONENUMBER);

            //比较两次验证码是否相同
            if (validateCode != null && validateCode.equals(preValidateCode)) {
                //两次输入的验证码相同
                //向前端返回数据，前端不用提示信息直接进行下一步
                return new Result(true, "");
            } else {
                //两次输入的验证码不相同
                return new Result(false, "验证码输入有误或时间超时");
            }
        } catch (Exception e) {
            //打印异常信息
            e.printStackTrace();
            return new Result(false, "服务器异常,请联系管理员");
        }finally {
            //归还redis连接池的资源
            if (resource != null) {
                resource.close();
            }
        }
    }
}
