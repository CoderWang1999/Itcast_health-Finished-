package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.constant.MessageConstant;
import com.itheima.dao.MemberDao;
import com.itheima.dao.OrderDao;
import com.itheima.dao.SetmealDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;
import com.itheima.pojo.Order;
import com.itheima.service.MemberService;
import com.itheima.utils.DateUtils;
import com.itheima.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDao memberDao;
    @Autowired
    private SetmealDao setMealDao;
    @Autowired
    private OrderDao orderDao;

    ///根据手机号查询会员
    @Override
    public Member findByTelephone(String telephone) {
        Member member=null;
        if (telephone!=null){
            member= memberDao.findByTelephone(telephone);
        }
        return member;
    }

    //新增会员
    @Override
    public void add(Member member) {
        if (member!=null){
            String password = member.getPassword();
            if (password!=null){
                //使用md5加密
                password=MD5Utils.md5(password);
                member.setPassword(password);
            }
            memberDao.add(member);
        }
    }

    @Override
    public List<Integer> findMemberCountByMonths(List<String> months) {
        List<Integer> list=new ArrayList<>();
        if (months!=null){
            for (String month : months) {
                month+=".31";
                Integer count = memberDao.findMemberCountBeforeDate(month);
                list.add(count);
            }
        }
        return list;
    }
    //========================================================================
    //分页查询
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        //取出QueryPageBean封装的数据
        Integer pageSize = queryPageBean.getPageSize();// 每页面显示的条数
        Integer currentPage = queryPageBean.getCurrentPage();//当前页数
        String queryString = queryPageBean.getQueryString(); //查询条件
        PageHelper.startPage(currentPage, pageSize);
        //查询操作  使用动态sql语句 因为queryString可能为空
        Page<Member> page = memberDao.findPage(queryString);
        //健康管理师
        List<String> namelist = memberDao.findHealthManager();
        for (Member member : page) {
            //生日换算年龄
            if (member.getBirthday()!=null){
                member.setAge(DateUtils.getAgeByBirth(member.getBirthday()));
            }

            if (member.getHealthmanager() == null) {
                member.setHealthmanager("此会员暂时未绑定健康管理师");
            }

            //如果查询的健康管理师不包含这个会员管理的健康管理师 那么说明此用户健康管理师权限消失
            if ((!namelist.contains(member.getHealthmanager()))&&(!member.getHealthmanager().equals("此会员暂时未绑定健康管理师"))) {
                //给出显示信息
                String message="管理师已失去权限,请更换";
                member.setHealthmanager(message);
            }
        }
        //          每页总条数
        long total = page.getTotal();
        //查询出的Member表数据
        List<Member> result = page.getResult();

        return new PageResult(total,result);

    }

    /**
     * 查询健康管理师
     * @return
     */
    @Override
    public List<Map<String, Object>>  findHealthManager() {
        List<String> namelist = memberDao.findHealthManager();
        List<Map<String, Object>> list = new ArrayList<>();
        for (String name : namelist) {
            Map<String, Object> map = new HashMap<>();
            map.put("value",name);
            list.add(map);
        }

        return list;
    }

    @Override
    public void addMember(Member member) {
        memberDao.addMember(member);
    }
    //编辑修改会员信息
    @Override
    public Member findMemberById(Integer memberId) {

        return memberDao.findMemberById(memberId);
    }

    /**
     * 此方法与前端公用  注意!!!!!!!!!!!!!
     * @param member
     */
    @Override
    public void editMember(Member member) {
        //修改会员表里的内容
        memberDao.editMember(member);
    }

    @Override
    public Result deleteMember(Integer id) {
        List<Order> orders = orderDao.findOrderById(id);
        System.out.println("orders"+(orders == null));
        if (orders .size()==0) {
            memberDao.deleteMember(id);
            return new Result(true, MessageConstant.DELETE_MEMBER_SUCCESS);
        } else {
            //根据id查询套餐
            //返回信息的拼接
            StringBuilder meassage = new StringBuilder();
            meassage.append("删除失败,此会员有预约:");
            //套餐姓名
            List<String> setmeals=null;
            for (Order order : orders) {
                //查询获取套餐信息
                setmeals = setMealDao.findSetmealNameById(order.getSetmealId());
                if (order.getOrderType() != null) {
                    meassage.append(order.getOrderType()+",");
                }
            }

            if (setmeals != null) {
                for (String setmeal : setmeals) {
                    //套餐信息添加
                    meassage.append(setmeal+",");
                }
            }
            return new Result(false, meassage.toString());
        }


    }

    @Override
    public List<String> findAllmessageById(Integer id) {
        //查询所有关联信息
        List<Map<String, Object>> list = memberDao.findAllmessageById(id);
        //查询机构地址

        Set<String> setmealSet = new HashSet<>();
        Set<String> checkgrouplSet= new HashSet<>();
        Set<String> checkitemsSet= new HashSet<>();
        Set<String> addressSet= new HashSet<>();

        for (Map<String, Object> map : list) {
            //取出需要的字段名称
            String setmeal = (String) map.get("setmeal");
            String checkgroup = (String) map.get("checkgroups");
            String checkitems = (String) map.get("checkitems");
            String address = (String) map.get("address");
            //添加到各自的集合中
            setmealSet.add(setmeal);
            checkgrouplSet.add(checkgroup);
            checkitemsSet.add(checkitems);
            addressSet.add(address);
        }
        //存入集合返回
        List<String> list1 = new ArrayList<>();
        //判断套餐是否为空
        if (setmealSet .toString().equals("[]")) {
            list1.add("");
        }else {
            String setmeal = setmealSet.toString().substring(1, setmealSet.toString().indexOf(']'));
            list1.add(setmeal);
        }
        //判断检查组是否为空
        if (checkgrouplSet.toString().equals("[]")) {
            list1.add("");
        }else {
            list1.add(checkgrouplSet.toString().substring(1, checkgrouplSet.toString().indexOf(']')));
        }
        //判断检查项是否为空
        if (checkitemsSet .toString().equals("[]")) {
            list1.add("");
        }else {
            list1.add(checkitemsSet.toString().substring(1, checkitemsSet.toString().indexOf(']')));
        }
        //判断地址是否为空
        if (addressSet .toString().equals("[]")) {
            list1.add("");
        }else {
            list1.add(addressSet.toString().substring(1, addressSet.toString().indexOf(']')));
        }

        return list1;
    }
    @Override
    public Member findByEmailAndPwd(String email, String md5_password) {
        return memberDao.findByEmailAndPwd(email,md5_password);
    }
    @Override
    public void editEmail(Member member) {
        memberDao.editMember(member);
    }

    @Override
    public void editPhoneNumber(Member member) {
        memberDao.editMember(member);
    }
    @Override
    public void editPassword(Member member) {
        memberDao.editMember(member);
    }
}
