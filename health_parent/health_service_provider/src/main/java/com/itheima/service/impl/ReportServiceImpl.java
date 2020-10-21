package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.dao.MemberDao;
import com.itheima.dao.OrderDao;
import com.itheima.dao.ReportDao;
import com.itheima.pojo.Member;
import com.itheima.service.ReportService;
import com.itheima.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service(interfaceClass = ReportService.class)
@Transactional
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportDao reportDao;

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private OrderDao orderDao;

    public List<Integer> findOrderByMonth(List<String> yearAndMonth) throws Exception {
        if (yearAndMonth != null && yearAndMonth.size() > 0) {
            List<Integer> countList = new ArrayList<>();

            for (String year_month : yearAndMonth) {
                //把年份，月份进行格式化并设置成本月的31号
                String formatYearMonth = year_month + ".31";
                //把年月日(每月的31号)转换成Date格式
                Date string2Date = DateUtils.parseString2Date(formatYearMonth, "yyyy.MM.dd");
                //把年月日(每月的31号)转换成string yyyy-MM-dd
                String date2String = DateUtils.parseDate2String(string2Date, "yyyy-MM-dd");
                //把查询到的结果封装进集合中返回
                Integer orderCount = reportDao.findOrderByMonth(date2String);
                Integer arriveCount = reportDao.findArriveByMonth(date2String);
                countList.add(orderCount);
                countList.add(arriveCount);
            }
            return countList;
        }
        return null;
    }

    public List<Integer> findArriveByMonth(List<String> yearAndMonth) throws Exception {
        if (yearAndMonth != null && yearAndMonth.size() > 0) {
            List<Integer> countList1=new ArrayList<>();

            for (String year_month : yearAndMonth) {
                //把年份，月份进行格式化并设置成本月的31号
                String formatYearMonth = year_month + ".31";
                //把年月日(每月的31号)转换成Date格式
                Date string2Date = DateUtils.parseString2Date(formatYearMonth,"yyyy.MM.dd");
                //把年月日(每月的31号)转换成string yyyy-MM-dd
                String date2String = DateUtils.parseDate2String(string2Date, "yyyy-MM-dd");
                //把查询到的结果封装进集合中返回
                Integer arriveCount=reportDao.findArriveByMonth(date2String);
                countList1.add(arriveCount);
            }
            return countList1;
        }
        return null;
    }



    /**
     * 查询已预约的套餐的名称和对应的已预约的套餐的金额
     * @return
     */
    public List<Map> findSetmealMoney() {
        return reportDao.findSetmealMoney();
    }

    public Map<String, Object> getMemberAgeReport() {
        List<Member> lists = memberDao.findAll();
        List<Integer> ages = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        int a = 0, b = 0, c = 0, d = 0, e = 0, f = 0;
        for (Member member : lists) {
            Date birthday = member.getBirthday();
            int age = getAgeByBirth(birthday);
            if (age > 0 && age <= 6) {
                a++;
            }
            if (age > 7 && age <= 12) {
                b++;
            }
            if (age > 12 && age <= 17) {
                c++;
            }
            if (age > 17 && age <= 45) {
                d++;
            }
            if (age > 44 && age <= 69) {
                e++;
            }
            if (age > 69) {
                f++;
            }
        }
        ages.add(a);
        ages.add(b);
        ages.add(c);
        ages.add(d);
        ages.add(e);
        ages.add(f);
        List<String> name = new ArrayList<>();
        name.add("婴幼儿");
        name.add("少儿");
        name.add("青少年");
        name.add("青年");
        name.add("中年");
        name.add("老年");
        result.put("memberAgeName", name);
        result.put("memberAgeCount", ages);
        return result;
    }


    private static int getAgeByBirth(Date birthday) {
        if (birthday == null) {
            int age = -1;
            return age;
        }
        int age = 0;
        Calendar cal = Calendar.getInstance();
        if (cal.before(birthday)) { //出生日期晚于当前时间，无法计算
            throw new IllegalArgumentException(
                    "The birthDay is before Now.It's unbelievable!");
        }
        int yearNow = cal.get(Calendar.YEAR);  //当前年份
        int monthNow = cal.get(Calendar.MONTH);  //当前月份
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); //当前日期
        cal.setTime(birthday);
        int yearBirth = cal.get(Calendar.YEAR);
        int monthBirth = cal.get(Calendar.MONTH);
        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);
        age = yearNow - yearBirth;   //计算整岁数
        if (monthNow <= monthBirth) {
            if (monthNow == monthBirth) {
                if (dayOfMonthNow < dayOfMonthBirth) age--;//当前日期在生日之前，年龄减一
            } else {
                age--;//当前月份在生日之前，年龄减一
            }
        }
        return age;
    }

    @Override
    public Map<String, Object> getBusinessReportData() throws Exception {
        //获得本周一的日期，中国是以周一算起
        Date thisWeekMonday = DateUtils.getThisWeekMonday(new Date());
        //转换成数据库中存储的时间格式，方便查询
        String thisWeekMonday_String = DateUtils.parseDate2String(thisWeekMonday, "yyyy-MM-dd");

        //获得本月的第一天
        Date firstDay4ThisMonth = DateUtils.getFirstDay4ThisMonth();
        //转换成数据库中存储的时间格式，方便查询
        String firstDay4ThisMonth_String = DateUtils.parseDate2String(firstDay4ThisMonth, "yyyy-MM-dd");

        //总会员数
        Integer totalMember = memberDao.findMemberTotalCount();
        //(当天)新增会员数
        Integer todayNewMember = memberDao.findMemberCountByDate(DateUtils.parseDate2String(new Date(), "yyyy-MM-dd"));
        //本周新增会员数
        Integer thisWeekNewMember = memberDao.findMemberCountAfterDate(thisWeekMonday_String);
        //本月新增会员数
        Integer thisMonthNewMember = memberDao.findMemberCountAfterDate(firstDay4ThisMonth_String);

        //今日预约数
        Integer todayOrderNumber = orderDao.findOrderCountByDate(DateUtils.parseDate2String(new Date(), "yyyy-MM-dd"));
        //本周预约数
        Integer thisWeekOrderNumber = orderDao.findOrderCountAfterDate(thisWeekMonday_String);
        //本月预约数
        Integer thisMonthOrderNumber = orderDao.findOrderCountAfterDate(firstDay4ThisMonth_String);

        //今日到诊数
        Integer todayVisitsNumber = orderDao.findVisitsCountByDate(DateUtils.parseDate2String(new Date(), "yyyy-MM-dd"));
        //本周到诊数
        Integer thisWeekVisitsNumber = orderDao.findVisitsCountAfterDate(thisWeekMonday_String);
        //本月到诊数
        Integer thisMonthVisitsNumber = orderDao.findVisitsCountAfterDate(firstDay4ThisMonth_String);

        //热门套餐查询(前四条)
        List<Map> hotSetmeal = orderDao.findHotSetmeal();

        //把数据封装进map集合并返回
        Map<String, Object> result = new HashMap<>();
        result.put("reportDate", DateUtils.parseDate2String(new Date(), "yyyy-MM-dd"));
        result.put("todayNewMember", todayNewMember);
        result.put("totalMember", totalMember);
        result.put("thisWeekNewMember", thisWeekNewMember);
        result.put("thisMonthNewMember", thisMonthNewMember);
        result.put("todayOrderNumber", todayOrderNumber);
        result.put("thisWeekOrderNumber", thisWeekOrderNumber);
        result.put("thisMonthOrderNumber", thisMonthOrderNumber);
        result.put("todayVisitsNumber", todayVisitsNumber);
        result.put("thisWeekVisitsNumber", thisWeekVisitsNumber);
        result.put("thisMonthVisitsNumber", thisMonthVisitsNumber);
        result.put("hotSetmeal", hotSetmeal);
        return result;
    }
}
