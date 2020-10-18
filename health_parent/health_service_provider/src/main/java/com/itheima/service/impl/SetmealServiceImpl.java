package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.constant.RedisConstant;
import com.itheima.dao.SetmealDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Setmeal;
import com.itheima.service.SetmealService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import redis.clients.jedis.JedisPool;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SetmealServiceImpl implements SetmealService {
    @Autowired
    private SetmealDao setmealDao;
    //注入JedisPool
    @Autowired
    private JedisPool jedisPool;
    //注入freeMarkerConfigurer
    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;
    //从属性文件中读取要生成的html对应的目录
    private String outPutPath = "D:/IDE/Idea_space/itcast_health/health_parent/health_mobile/src/main/webapp/staticPages";

    //新增
    @Override
    public void add(Setmeal setmeal, Integer[] checkgroupIds) {
        //新增套餐
        setmealDao.addSetmeal(setmeal);
        //获取SetmealId
        Integer setmealId = setmeal.getId();
        //调用新增关联关系方法
        this.setSetmealIdAndCheckGroupId(setmealId, checkgroupIds);
        //获取图片名称
        String fileName = setmeal.getImg();
        //新建套餐成功之后将图片名称存入Redis小集合中
        jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_DB_RESOURCES, fileName);
        //当添加套餐后需要重新生成静态页面（套餐列表页面、套餐详情页面）
        generateMobileStaticHtml();
    }

    //生成当前方法所需的静态页面
    public void generateMobileStaticHtml() {
        //在生成静态页面之前需要查询数据
        List<Setmeal> list = setmealDao.findAll();

        //需要生成套餐列表静态页面
        generateMobileSetmealListHtml(list);

        //需要生成套餐详情静态页面
        generateMobileSetmealDetailHtml(list);
    }

    //生成套餐列表静态页面
    public void generateMobileSetmealListHtml(List<Setmeal> list) {
        Map map = new HashMap();
        //为模板提供数据，用于生成静态页面
        map.put("setmealList", list);
        generteHtml("mobile_setmeal.ftl", "m_setmeal.html", map);
    }

    //生成套餐详情静态页面（可能有多个）
    public void generateMobileSetmealDetailHtml(List<Setmeal> list) {
        for (Setmeal setmeal : list) {
            HashMap map = new HashMap();
            map.put("setmeal", setmealDao.findById(setmeal.getId()));
            generteHtml("mobile_setmeal_detail.ftl", "setmeal_detail_" + setmeal.getId() + ".html", map);
        }
    }

    //通用方法，用于生成静态页面
    public void generteHtml(String templateName, String htmlPageName, Map map) {
        //获取配置对象
        Configuration configuration = freeMarkerConfigurer.getConfiguration();
        Writer out = null;
        try {
            //加载模板文件
            Template template = configuration.getTemplate(templateName);
            //构造输出流
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(outPutPath + "/" + htmlPageName)), "UTF-8"));
            //输出文件
            template.process(map, out);
            //关流释放资源
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //分页查询
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取当前页，总页数，条件查询的参数
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();
        //启动分页插件
        PageHelper.startPage(currentPage, pageSize);
        //调用持久层查询所有
        Page<Setmeal> page = setmealDao.selectByCondition(queryString);
        //获取总条目数
        long total = page.getTotal();
        //获取查询结果
        List<Setmeal> rows = page.getResult();
        return new PageResult(total, rows);
    }

    //查询所有套餐
    @Override
    public List<Setmeal> findAll() {
        return setmealDao.findAll();
    }

    //根据id查询套餐信息
    @Override
    public Setmeal findById(int id) {
        return setmealDao.findById(id);
    }

    //套餐预约占比饼形图
    @Override
    public List<Map<String, Object>> findSetmealCount() {
        return setmealDao.findSetmealCount();
    }

    //根据套餐Id查询检查组id
    @Override
    public List<String> findIdInMiddleTable(String setMealId) {
        List<String> checkgroupIds = new ArrayList<>();
        if (setMealId != null && !setMealId.equals("")) {
            checkgroupIds = setmealDao.findCheckGroupIdsBySetMealId(setMealId);
        }
        return checkgroupIds;
    }

    //编辑套餐
    @Override
    public void edit(Setmeal setmeal, Integer[] checkgroupIds, String tempImgId) {
        //把Redis中小集合中存的图片名称替换
        if (tempImgId != null && !tempImgId.equals("")) {
            //清理Redis中小集合内的原图片名
            jedisPool.getResource().srem(RedisConstant.SETMEAL_PIC_DB_RESOURCES, tempImgId);
            //将更新后的图片名称存入Redis
            String fileName = setmeal.getImg();
            jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_DB_RESOURCES, fileName);
        }
        //编辑套餐
        setmealDao.editSetmeal(setmeal);
        //获取SetmealId
        Integer setmealId = setmeal.getId();
        //编辑套餐和检查组关联关系
        if (checkgroupIds != null && checkgroupIds.length > 0) {
            //先清空关联关系
            setmealDao.deleteSetmealAndCheckgroup(setmealId);
            this.setSetmealIdAndCheckGroupId(setmealId, checkgroupIds);
        }
        //生成静态页面
        generateMobileStaticHtml();
    }

    //删除套餐
    @Override
    public void delete(Integer setMealId, String imgId) {
        //删除Redis中小集合中的图片
        if (imgId != null && !imgId.equals("")) {
            jedisPool.getResource().srem(RedisConstant.SETMEAL_PIC_DB_RESOURCES, imgId);
        }
        //删除操作
        if (setMealId!=null&&!setMealId.equals("")){
            //先删除关联关系
            setmealDao.deleteSetmealAndCheckgroup(setMealId);
            //根据id删除套餐
            setmealDao.deleteSetmealById(setMealId);
        }
        //生成静态页面
        generateMobileStaticHtml();
    }

    //抽取的新增关联关系的方法
    public void setSetmealIdAndCheckGroupId(Integer setmealId, Integer[] checkgroupIds) {
        //判断检查项ids数组是否为空
        if (checkgroupIds != null && checkgroupIds.length > 0) {
            //不为空则遍历数组，用map存储CheckItemId和CheckGroupId
            for (Integer checkgroupId : checkgroupIds) {
                Map map = new HashMap<>();
                map.put("setmealId", setmealId);
                map.put("checkgroupId", checkgroupId);
                //新增关联关系
                setmealDao.setSetmealIdAndCheckGroupId(map);
            }
        }
    }
}
