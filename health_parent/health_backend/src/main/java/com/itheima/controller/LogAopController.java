package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.pojo.Syslog;
import com.itheima.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

@Aspect
@Controller
@Configuration
@ComponentScan("com.itheima.controller")
@EnableAspectJAutoProxy
public class LogAopController {
    @Autowired
    private HttpServletRequest request;

    @Reference //注意不同的项目下不能使用@Autowired  要是用@Reference
    private ISysLogService service;

    private Date visitTime;//5开始时间
    private Class clazz;//6访问的类
    private Method method;//7访问的方法
/*
1如何获取操作者?
     * 2如何获取访问的ip
     * 3如何获取访问的url
     * 4如何获取执行的时长
*/


    //前置通知,主要获取开始时间,执行的类是哪一个,执行了哪个方法
    @Before("execution(* com.itheima.controller.*.*(..))")//.*是包下的所有类 .*是类下的所有方法
    public void doBefore(JoinPoint joinPoint) throws NoSuchMethodException, ClassNotFoundException {
        visitTime = new Date();//当前时间就是开始的时间
        clazz = joinPoint.getTarget().getClass();//获取类
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        for (Method m : methods) {
            if (m.getName().equals(methodName)) {
                Class[] clazzs = m.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    method=m;
                    break;
                }
            }
        }
    }
        //后置通知
        @After("execution(* com.itheima.controller.*.*(..))")
        public void doAfter (JoinPoint jp){
            //4如何获取执行的时长?
            String time = String.valueOf(new Date().getTime() - visitTime.getTime());
            //3如何获取访问的url
            String url = "";
            if (clazz != null && method != null && clazz != LogAopController.class) {
                //获取url @RequestMapping("/findAll.do")
                //子类 对象名= (子类) 父类; 强制转换 将父类对象赋予子类对象需要强制转换为子类对象(小知识点!!!!)
                RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
                if (classAnnotation != null) {
                    //1.获取类上的路径
                    String[] classValue = classAnnotation.value();
                    //2.获取方法上的路径
                    RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                    if (methodAnnotation != null) {
                        String[] methodValue = methodAnnotation.value();//获取了方法上的路径
                        //类路径+方法路径
                        url = classValue[0] + methodValue[0];
                    }
                }
            }
            //如何获取2如何获取访问的ip
            //1.配置web.xml 获取HttpServletRequest 2.注入依赖获取request对象
            String ip = request.getRemoteAddr(); ///获取ip
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            //封装信息
            Syslog syslog = new Syslog();
            UUID uuid = UUID.randomUUID();
            syslog.setId(uuid.toString());//1
            syslog.setExecutionTime(time);//2
            syslog.setIp(ip);//3
            syslog.setMethod("[类]" + clazz.getName() + "[方法]" + method.getName());//4
            syslog.setUrl(url);//5
            syslog.setUsername(user.getUsername());//6
            syslog.setVisitTime(visitTime);//7
            syslog.setConsumerName("pighome");
            System.out.println(syslog);
            service.saveLog(syslog);
        }
    }
