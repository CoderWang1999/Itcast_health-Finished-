package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.itheima.constant.MessageConstant;
import com.itheima.constant.RedisMessageConstant;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;
import com.itheima.service.MemberService;
import com.itheima.utils.MD5Utils;
import com.itheima.utils.SendEmailUtils;
import com.itheima.utils.ValidateCodeUtils;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private JedisPool jedisPool;

    @Reference
    private MemberService memberService;

    /**
     * 通过账号密码登录
     *
     * @param response 向客户端浏览器写cookie
     * @param request  向session中存储会员信息用户跟踪
     * @param dataMap  前端传来的手机号和验证码
     * @return
     */
    @RequestMapping("/login4ValidateCode")
    public Result login4ValidateCode(HttpServletRequest request, HttpServletResponse response, @RequestBody Map dataMap) {
        Jedis resource = jedisPool.getResource();

        try {
            //获取前端输入的手机号
            String telephone = (String) dataMap.get("telephone");

            //获取前端输入的验证码
            String inputValidateCode = (String) dataMap.get("validateCode");

            //获取redis数据库中存储的验证码
            String validateCodeInRedis = resource.get(telephone + RedisMessageConstant.SENDTYPE_LOGIN);

            if (inputValidateCode != null && validateCodeInRedis != null && inputValidateCode.equals(validateCodeInRedis)) {
                //查询该用户是否已经是会员
                Member member = memberService.findByTelephone(telephone);
                if (member == null) {
                    //该用户不是会员，完成自动注册
                    member = new Member();
                    member.setPhoneNumber(telephone);
                    member.setRegTime(new Date());
                    memberService.add(member);
                }

                //向客户端浏览器写入cookie用于追踪用户
                Cookie cookie = new Cookie("login_member_telephone", telephone);
                //路径是否带着cookie
                cookie.setPath("/");
                //cookie的保存时间
                cookie.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(cookie);

                //将会员信息保存到redis用于确认用户是否登录
//                String menberJson = JSON.toJSON(member).toString();
//                resource.setex(telephone, 60 * 30, menberJson);

                //将会员信息保存到session中用于追踪
                HttpSession session = request.getSession();
                session.setAttribute("MemberMessage", member);

                return new Result(true, MessageConstant.SEND_VALIDATECODE_SUCCESS);
            } else {
                //返回验证码输入错误
                return new Result(false, MessageConstant.VALIDATECODE_ERROR);
            }
        } catch (Exception e) {
            e.printStackTrace();
            //返回验证码输入错误
            return new Result(false, MessageConstant.VALIDATECODE_ERROR);
        } finally {
            //释放资源
            if (resource != null) {
                resource.close();
            }
        }
    }

    /**
     * 通过用户名/邮箱 密码登录
     *
     * @param response 向客户端浏览器写cookie
     * @param request  向session中存储会员信息用于跟踪
     * @param dataMap  前端传来的用户名/邮箱(username) 密码
     * @return
     */
    @RequestMapping("/login4EmailAndPwd")
    public Result login4EmailAndPwd(HttpServletRequest request, HttpServletResponse response, @RequestBody Map dataMap) {
        //获取邮箱
        String email = (String) dataMap.get("email");
        //获取密码
        String password = (String) dataMap.get("password");
        //对密码进行加密
        String md5_password = MD5Utils.md5(password);

        //邮箱和密码都不为空
        if (email != null && email.length() > 0 && password != null && password.length() > 0) {
            //根据邮箱和加密后的密码查找用户
            Member member = memberService.findByEmailAndPwd(email, md5_password);

            //当前用户存在
            if (member != null) {
                //向客户端浏览器写入cookie用于追踪用户,里面存储该用户的邮箱和密码
                Cookie cookie = new Cookie("login_member_emailandpwd", email + "&" + password);
                //设置路径 "/"下的路径都带着cookie
                cookie.setPath("/");
                //cookie的保存时间
                cookie.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(cookie);

                //将会员信息保存到session中用于追踪
                HttpSession session = request.getSession();
                session.setAttribute("MemberMessage", member);

                return new Result(true, MessageConstant.SEND_VALIDATECODE_SUCCESS);
            } else {
                return new Result(false, "用户不存在,请重新输入邮箱密码");
            }
        } else {
            return new Result(false, MessageConstant.LOGIN_FAIL);
        }
    }

    /**
     * 如果上一次是电话号码登录，进行电话号码的回想
     * 如果上一次是邮箱密码登录，下次免登录
     *
     * @param request
     * @return
     */
    @RequestMapping("/init")
    public Result init(HttpServletRequest request) {
        try {
            //获取请求路径中所有的cookie
            Cookie[] cookies = request.getCookies();

            //遍历这个cookie集合,判断用户上一次是否是用邮箱密码登录
            if (cookies != null && cookies.length > 0) {
                for (Cookie cookie : cookies) {
                    //找到那个名称为login_member_emailandpwd的cookie
                    if (cookie.getName() != null && cookie.getName().equals("login_member_emailandpwd")) {
                        //取出里面的邮箱和密码
                        String emailAndPwd = cookie.getValue();

                        //取出邮箱、密码
                        if (emailAndPwd != null && emailAndPwd.length() > 0) {
                            String[] emailAndPwdArr = emailAndPwd.split("&");
                            //邮箱
                            String email = emailAndPwdArr[0];
                            //密码
                            String password = emailAndPwdArr[1];
                            //加密后的密码
                            String md5_password = MD5Utils.md5(password);
                            //根据邮箱和加密后的密码查找用户
                            Member member = memberService.findByEmailAndPwd(email, md5_password);
                            if (member != null) {
                                //将会员信息保存到session中用于追踪
                                HttpSession session = request.getSession();
                                session.setAttribute("MemberMessage", member);

                                //如果找到这个用户那么前端直接跳转到index.html
                                return new Result(true, "", "toIndex");
                            } else {
                                return new Result(false, "该用户已被删除");
                            }

                        }
                    }
                }

                //再次遍历这个cookie集合，用于电话号码的回显
                for (Cookie cookie : cookies) {
                    //找到那个名称为login_member_telephone的cookie
                    if (cookie.getName() != null && cookie.getName().equals("login_member_telephone")) {
                        String telephone = cookie.getValue();
                        return new Result(true, "", telephone);
                    }
                }
            }
            return new Result(false, "");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "服务器正在维护，请联系管理员");
        }
    }

    /**
     * 进行会员信息的回显
     *
     * @param request 获取session中存储的会员信息
     * @return
     */
    @RequestMapping("/playBackMemberMessage")
    public Member playBackMemberMessage(HttpServletRequest request) {
        //获取存储在session中的目前登录的会员信息
        Member member = (Member) request.getSession().getAttribute("MemberMessage");

        //把member对象返回
        return member;
    }

    /**
     * 退出登录
     *
     * @param request  用于得到指定cookie
     * @param response 用于删除指定cookie
     * @return
     */
    @RequestMapping("/logout")
    public Map logout(HttpServletRequest request, HttpServletResponse response) {
        try {
            //清除session中存储的会员的信息
            request.getSession().removeAttribute("MemberMessage");

            //得到该请求携带的所有cookie
            Cookie[] cookies = request.getCookies();
            if (cookies != null && cookies.length > 0) {
                //遍历cookies集合
                for (Cookie cookie : cookies) {
                    //得到邮箱密码登录时设置的cookie
                    if ("login_member_emailandpwd".equals(cookie.getName())) {
                        //获得邮箱和密码
                        String emailAndPwd = cookie.getValue();
                        //邮箱密码中间用"&"连接
                        String[] emailAndPwdArr = emailAndPwd.split("&");

                        //邮箱
                        String email = emailAndPwdArr[0];
                        //密码
                        String password = emailAndPwdArr[1];

                        //把密码和邮箱封装进map集合,用于登录界面的回显
                        HashMap<String, String> dataMap = new HashMap<>();
                        //告诉前端需要携带参数跳转
                        dataMap.put("message", "forward_with_param");
                        dataMap.put("email", email);
                        dataMap.put("password", password);

                        //清除这个cookie,以下步骤缺一不可
                        cookie.setValue("");
                        cookie.setPath("/");
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);

                        //返回dataMap，里面有邮箱和密码
                        return dataMap;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //此次登录不是邮箱密码登录，那么返回此map集合告诉前端不需携带参数直接跳转登录页面
        //顺便防止空指针异常
        HashMap<String, String> dataMap = new HashMap<>();
        //告诉前端不需携带参数跳转
        dataMap.put("message", "forward_without_param");
        return dataMap;
    }

    /**
     * 修改会员邮箱
     *
     * @param member   前端传来的会员对象
     * @param newEmail 前端传来的新的电子邮件的地址
     * @return
     */
    @RequestMapping("/editEmail")
    public Result editEmail(@RequestBody Member member, String newEmail, HttpServletRequest request) {
        try {
            //获取该会员的id用于修改后回显该会员的数据
            Integer id = member.getId();

            //用新邮箱替换旧邮箱
            member.setEmail(newEmail);

            //更新会员表
            memberService.editEmail(member);

            //查找修改后的该会员用于数据用于更新session
            member = memberService.findMemberById(id);

            //获取存储在session中的会员信息并更新
            request.getSession().setAttribute("MemberMessage", member);

            //返回修改邮箱成功信息用于前端显示
            return new Result(true, "邮箱修改成功", member);
        } catch (Exception e) {
            //打印异常信息
            e.printStackTrace();

            //返回修改邮箱失败信息用于前端显示
            return new Result(false, "邮箱修改失败");
        }
    }

    /**
     * 修改会员手机号
     *
     * @param member         前端传来的会员对象
     * @param newPhoneNumber 前端传来的新的手机号的号码
     * @return
     */
    @RequestMapping("/editPhoneNumber")
    public Result editPhoneNumber(@RequestBody Member member, String newPhoneNumber, HttpServletRequest request) {
        try {
            //获取该会员的id用于修改后回显该会员的数据
            Integer id = member.getId();

            //用新手机号替换旧手机号
            member.setPhoneNumber(newPhoneNumber);

            //更新会员表
            memberService.editPhoneNumber(member);

            //查找修改后的该会员用于数据的回显
            member = memberService.findMemberById(id);

            //获取存储在session中的会员信息并更新
            request.getSession().setAttribute("MemberMessage", member);

            //返回修改手机号成功信息用于前端显示
            return new Result(true, "手机号修改成功", member);
        } catch (Exception e) {
            //打印异常信息
            e.printStackTrace();

            //返回修改手机号失败信息用于前端显示
            return new Result(false, "手机号修改失败");
        }
    }

    /**
     * 修改会员的密码
     *
     * @param map      会员的新密码，二次确认的新密码
     * @param memberId 会员id
     * @param request  用于得到session cookie
     * @param response 用于清除cookie
     * @return
     */
    @RequestMapping("/editPassword")
    public Result editPassword(@RequestBody Map map, String memberId, HttpServletRequest request, HttpServletResponse response) {
        try {
            //根据前端传来的id找到这个会员
            Member member = memberService.findMemberById(Integer.parseInt(memberId));

            //取出这个会员的邮箱把数据返回给前端
            String email = member.getEmail();

            //对这个密码进行MD5加密
            String md5Password = MD5Utils.md5((String) map.get("password"));

            //把这个会员中的密码更新
            member.setPassword(md5Password);

            //把这个会员保存到数据库中
            memberService.editPassword(member);

            //在这里假定清楚session和cookie都没有出现异常
            //如果出现了异常可以考虑把session和cookie再重新写回去

            //清除session
            request.getSession().removeAttribute("MemberMessage");

            //清除cookie
            //得到该请求携带的所有cookie
            Cookie[] cookies = request.getCookies();
            if (cookies != null && cookies.length > 0) {
                //遍历cookies集合
                for (Cookie cookie : cookies) {
                    //得到该会员登录时候写到浏览器的cookie
                    if ("login_member_emailandpwd".equals(cookie.getName())) {
                        //清除这个cookie(通过邮箱密码登录的时候写的cookie),以下步骤缺一不可
                        cookie.setValue("");
                        cookie.setPath("/");
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }

            //把邮箱返回给前端
            return new Result(true, "密码修改成功",email);
        } catch (Exception e) {
            return new Result(false, "修改密码失败");
        }
    }

    /**
     * 修改会员信息(除了手机号 身份证 邮箱 注册日期 密码)
     * @param member 前端传来的member对象
     * @return
     */
    @RequestMapping("/editMember")
    public Result editMember(@RequestBody Member member,HttpServletRequest request) {
        try {
            //更新数据库中的会员信息
            memberService.editMember(member);

            //获取存储在session中的会员信息并更新
            request.getSession().setAttribute("MemberMessage", member);

            //cookie不用清理

            //把member对象返回给前端用于数据回显
            return new Result(true, "修改成功", member);
        } catch (Exception e) {
            return new Result(false, "修改失败");
        }
    }
}
