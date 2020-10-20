package com.itheima.service.impl;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.constant.MessageConstant;
import com.itheima.constant.RedisMessageConstant;
import com.itheima.dao.MemberDao;
import com.itheima.dao.OrderDao;
import com.itheima.dao.OrderSettingDao;
import com.itheima.entity.Conditions;
import com.itheima.entity.PageResult;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;
import com.itheima.pojo.Order;
import com.itheima.pojo.OrderSetting;
import com.itheima.service.OrderService;
import com.itheima.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

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
    @Autowired
    private JedisPool jedisPool;

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

    /**
     * 提交数据
     *
     * @param dataMap
     * @return
     */
    @Override
    public Result submit(Map dataMap) {
        //验证生成的验证码和用户输入的验证码是否一致
        //查询用户选择的预约日期是否允许预约
        //查询用户选择的日期是否已经满员
        //查看用户是否是会员（根据手机号查询，不是会员自动注册成会员，是会员查看该用户是否已经预约）
        //进行预约操作(更新t_order表,更新已预约的人数,发送预约成功短信)
        //以上顺序不能打乱


        //因为有更新已预约人数的操作，所以我们前面写的后台查看预约信息这个也可以用的上

        Jedis resource = jedisPool.getResource();

        try {
            //当时生成的验证码
            String generateValidateCode = resource.get((String) dataMap.get("telephone") + RedisMessageConstant.SENDTYPE_ORDER);
            //用户输入的验证码
            String inputValidateCode = (String) dataMap.get("validateCode");
            if (generateValidateCode != null && inputValidateCode != null && generateValidateCode.equals(inputValidateCode)) {
                //验证码比较正确

                //获取体检日期
                String orderDate = (String) dataMap.get("orderDate");
                Date order_Date = DateUtils.parseString2Date(orderDate);

                //根据体检日期查询并把结果封装成OrderSetting对象
                OrderSetting orderSetting = orderSettingDao.findByOrderDate(order_Date);

                if (orderSetting != null) {
                    //说明用户选择的日期允许预约

                    //当天可预约的人数
                    int number = orderSetting.getNumber();
                    //当天已预约的人数
                    int reservations = orderSetting.getReservations();
                    if (number > 0 && reservations < number) {
                        //说明当天可以预约

                        //根据手机号查询用户
                        Member member = memberDao.findByTelephone((String) dataMap.get("telephone"));
                        if (member != null) {
                            //该用户已注册

                            //查询该用户对应的memberId
                            Integer memberId = member.getId();

                            //把该用户对应的memberId、预约日期、套餐id封装成order对象
                            Order order = new Order(memberId, order_Date, Integer.parseInt((String) dataMap.get("setmealId")));

                            //查询该用户对应的预约
                            List<Order> orderList = orderDao.findByCondition(order);

                            if (orderList != null && orderList.size() > 0) {
                                //该用户已经预约了
                                return new Result(false, MessageConstant.HAS_ORDERED);
                            } else {
                                //完善该预约信息
                                Order order1 = new Order(memberId, order_Date, Order.ORDERTYPE_WEIXIN, Order.ORDERSTATUS_NO, Integer.parseInt((String) dataMap.get("setmealId")));
                                //更新t_order表（添加）
                                orderDao.add(order1);

                                //设置预约人数+1
                                orderSetting.setReservations(orderSetting.getReservations() + 1);
                                orderSettingDao.editReservationsByOrderDate(orderSetting);

                                //发送预约成功短信
                                //阿里云目前不支持发送自定义通知，所以这里就不发送了
                                //放在service层是因为配置了事务，要成功都成功，要失败都失败
                                //SMSUtils.sendNoticeOfOeder(SMSUtils.ORDER_NOTICE, (String) dataMap.get("telephone"), (String) dataMap.get("name"), (String) dataMap.get("orderDate"));

                                //返回预约成功后新增的那条预约的id
                                return new Result(true, MessageConstant.ORDER_SUCCESS, order1.getId());
                            }

                        } else {
                            //该用户没有进行注册(member==null)
                            //对该用户进行注册
                            member = new Member();
                            member.setName((String) dataMap.get("name"));
                            member.setPhoneNumber((String) dataMap.get("telephone"));
                            member.setIdCard((String) dataMap.get("idCard"));
                            member.setSex((String) dataMap.get("sex"));

                            //把该用户添加进member表中
                            memberDao.add(member);

                            //返回用户添加成功后用户的id
                            Integer memberId = member.getId();

                            //更新t_order表（添加）
                            Order order1 = new Order(memberId, order_Date, Order.ORDERTYPE_WEIXIN, Order.ORDERSTATUS_NO, Integer.parseInt((String) dataMap.get("setmealId")));
                            orderDao.add(order1);

                            //设置预约人数+1
                            orderSetting.setReservations(orderSetting.getReservations() + 1);
                            orderSettingDao.editReservationsByOrderDate(orderSetting);

                            //发送预约成功短信
                            //阿里云目前不支持发送自定义通知，所以这里就不发送了
                            //放在service层是因为配置了事务，要成功都成功，要失败都失败
                            //SMSUtils.sendNoticeOfOeder(SMSUtils.ORDER_NOTICE, (String) dataMap.get("telephone"), (String) dataMap.get("name"), (String) dataMap.get("orderDate"));

                            //返回预约成功后新增的那条预约的id
                            return new Result(true, MessageConstant.ORDER_SUCCESS, order1.getId());
                        }

                    } else {
                        //当天预约人数已满
                        return new Result(false, MessageConstant.ORDER_FULL);
                    }

                } else {
                    //说明用户选择的日期不允许预约
                    return new Result(false, MessageConstant.SELECTED_DATE_CANNOT_ORDER);
                }
            } else {
                //返回验证码输入错误
                return new Result(false, MessageConstant.VALIDATECODE_ERROR);
            }
        } catch (Exception e) {
            //日期格式解析异常
            e.printStackTrace();
            return new Result(false, "日期格式解析失败");
        } finally {
            //释放资源
            if (resource != null) {
                resource.close();
            }
        }
    }

    @Override
    public List<Order> findByMemberIdWithCondition(Integer memberId) {
        return orderDao.findByMemberIdWithCondition(memberId);
    }

    @Override
    public List<Map> findAll4OrderAndSetmeal(Integer memberId) {
        return orderDao.findAll4OrderAndSetmeal(memberId);
    }

    @Override
    public List<Map> findSetmealByIdAndDate(Integer memberId, String startDate, String endDate, String setmealName) {
        if (setmealName != null && setmealName.length() > 0) {
            //套餐名称非空
            setmealName = "%" + setmealName + "%";
            return orderDao.findSetmealByIdAndDate(memberId, startDate, endDate, setmealName);
        } else {
            //套餐名称为空
            return orderDao.findSetmealByIdAndDateWithoutName(memberId, startDate, endDate);
        }
    }

    @Override
    public Map findAllDataByOrderId(Integer orderId) {
        return orderDao.findAllDataByOrderId(orderId);
    }

    //分页查询
    public PageResult findByPageAndCondition(Conditions conditions) {
        System.out.println("-----------------");
        System.out.println(conditions.toString());
        System.out.println("-----------------");
        Integer currentPage = conditions.getCurrentPage();
        Integer pageSize = conditions.getPageSize();
        //查询规则
        String queryString = conditions.getQueryString();
        System.out.println(queryString);
        Date[] queryDate = conditions.getQueryDate();
        String queryOrderStatus = conditions.getQueryOrderStatus();
        String queryOrderType = conditions.getQueryOrderType();

        PageHelper.startPage(currentPage, pageSize);
        Date startDate = null;
        Date endDate = null;
        if (queryDate != null && queryDate.length > 0) {
            startDate = queryDate[0];
            endDate = queryDate[1];
        }
        Page page = orderDao.findByPageAndCondition(queryString, startDate, endDate, queryOrderStatus, queryOrderType);
        //查询的总条数
        long total = page.getTotal();
        //查询的当前页的集合
        List result = page.getResult();
        return new PageResult(total, result);
    }

    //编辑操作，先查询点击对象的id
    public Map findOrderById(Integer id) {
        return orderDao.findOrderById1(id);
    }

    //通过订单id查询套餐id
    public List<Integer> findSetmealIdsByOrderId(Integer id) {
        return orderDao.findSetmealIdsByOrderId(id);
    }

    //新增预约
    public Result addPhoneOrder(Map map) throws Exception {
        //1、检查用户所选择的预约日期是否已经提前进行了预约设置，如果没有设置则无法进行预约
        String orderDate = (String) map.get("orderDate");//预约日期
        OrderSetting orderSetting = orderSettingDao.findByOrderDate(DateUtils.parseString2Date(orderDate));
        if (orderSetting == null) {
            //指定日期没有进行预约设置，无法完成体检预约
            return new Result(false, MessageConstant.SELECTED_DATE_CANNOT_ORDER);
        }
        //2、检查用户所选择的预约日期是否已经约满，如果已经约满则无法预约
        int number = orderSetting.getNumber();//可预约人数
        int reservations = orderSetting.getReservations();//已预约人数
        if (reservations >= number) {
            //已经约满，无法预约
            return new Result(false, MessageConstant.ORDER_FULL);
        }
        //3、检查用户是否重复预约（同一个用户在同一天预约了同一个套餐），如果是重复预约则无法完成再次预约
        String telephone = (String) map.get("phoneNumber");//获取用户页面输入的手机号
        Member member = memberDao.findByTelephone(telephone);
        Integer setmealId = null;
        if (member != null) {
            //判断是否在重复预约
            Integer memberId = member.getId();//会员ID
            Date order_Date = DateUtils.parseString2Date(orderDate);//预约日期
            setmealId = (Integer) map.get("setmealId");//套餐ID
            Order order = new Order(memberId, order_Date, setmealId);
            //根据条件进行查询
            List<Order> list = orderDao.findByCondition(order);
            if (list != null && list.size() > 0) {
                //说明用户在重复预约，无法完成再次预约
                return new Result(false, MessageConstant.HAS_ORDERED);
            }
        } else {
            //4、检查当前用户是否为会员，如果是会员则直接完成预约，如果不是会员则自动完成注册并进行预约
            member = new Member();
            member.setName((String) map.get("name"));
            member.setPhoneNumber(telephone);
            member.setIdCard((String) map.get("idCard"));
            member.setSex((String) map.get("sex"));
            member.setRegTime(new Date());
            memberDao.add(member);//自动完成会员注册
        }
        //5、预约成功，更新当日的已预约人数
        Order order = new Order();
        order.setMemberId(member.getId());//设置会员ID
        order.setOrderDate(DateUtils.parseString2Date(orderDate));//预约日期
        order.setOrderType((String) map.get("orderType"));//预约类型
        order.setOrderStatus(Order.ORDERSTATUS_NO);//到诊状态
        setmealId = (Integer) map.get("setmealId");
        order.setSetmealId(setmealId);//套餐ID
        orderDao.add(order);

        orderSetting.setReservations(orderSetting.getReservations() + 1);//设置已预约人数+1
        orderSettingDao.editReservationsByOrderDate(orderSetting);

        return new Result(true, MessageConstant.ORDER_SUCCESS, order.getId());
    }

    //保存编辑后的数据
    public void edit(Integer setmealId, Map map) {
        //获取dataEditForm中各个字段的值
        String name = (String) map.get("name");
        String phoneNumber = (String) map.get("phoneNumber");
        System.out.println(name);
        System.out.println(phoneNumber);
        memberDao.updateByOrder(name, phoneNumber);

        //将编辑页面的字段值重新封装为一个对象
        Order order = new Order();
        String orderDate = (String) map.get("orderDate");
        try {
            order.setOrderDate(DateUtils.parseString2Date(orderDate));
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(orderDate);
        String orderType = (String) map.get("orderType");
        order.setOrderType(orderType);
        System.out.println(orderType);
        String orderStatus = (String) map.get("orderStatus");
        order.setOrderStatus(orderStatus);
        Integer orderId = (Integer) map.get("orderId");
        order.setId(orderId);
        order.setSetmealId(setmealId);
        System.out.println(order);
        //执行修改
        orderDao.update(order);
    }

    //删除预约
    public void delete(Integer id) {
        orderDao.delete(id);
    }

    //修改预约状态
    public void statusEdit(Integer id) {
        Order order = orderDao.findOrderStatesById(id);
        if (order.getOrderStatus().equals("已到诊")) {
            orderDao.editStatus(id);
        } else {
            orderDao.editStatusTo(id);
        }
    }


    /**
     * 后台的预约管理中实现健康管理师的意见的回显
     * @param id  预约订单id值
     * @return
     */
    @Override
    public Order findHealtMessageById(Integer id) {
        return orderDao.findHealtMessageById(id);//返回order中的sport food suggestion第三个属性值封装到order中返回到前端
    }
    /**
     * 编辑用户的就诊状态
     * @param orderStatusId  0:表示由未到诊 变成已到诊
     * @param orderId  预约订单id值
     */
    @Override
    public void statusEdit(Integer orderStatusId, Integer orderId) {
        String orderStatus = null;
        if (orderStatusId == 0) {
            orderStatus = "已到诊";
        }
        orderDao.update1(orderStatus, orderId);
    }

}
