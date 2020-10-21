package com.itheima.constant;

public class RedisMessageConstant {
    public static final String SENDTYPE_ORDER = "001";//用于缓存体检预约时发送的验证码
    public static final String SENDTYPE_LOGIN = "002";//用于缓存手机号快速登录时发送的验证码
    public static final String SENDTYPE_GETPWD = "003";//用于缓存找回密码时发送的验证码
    public static final String SENDTYPE_EDITEMAIL = "004";//用于缓存修改邮箱时发送的验证码
    public static final String SENDTYPE_EDITPHONENUMBER = "005";//用于缓存修改手机号时发送的验证码
}