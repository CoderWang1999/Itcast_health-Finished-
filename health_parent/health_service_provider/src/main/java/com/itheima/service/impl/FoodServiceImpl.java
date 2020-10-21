package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.itheima.dao.FoodDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Food;
import com.itheima.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 饮食管理
 */
@Service(interfaceClass = FoodService.class)
@Transactional
public class FoodServiceImpl implements FoodService {
    @Autowired
    private FoodDao foodDao;


    //分页查询食品库
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<Food> page = foodDao.selectByCondition(queryString);
        long total = page.getTotal();
        List<Food> rows = page.getResult();

        return new PageResult(total,rows);
    }

    //新增饮食管理
    public void add(Food food) {
        foodDao.add(food);
    }

    //根据id查询 - 实现数据回显
    public Food findById(Integer id) {
        return foodDao.findById(id);
    }

    //删除
    public void delete(Integer id) {
        foodDao.delete(id);
    }

    //更新
    public void edit(Food food) {
        foodDao.edit(food);
    }

    //批量导入 去重复的方法
    public void save(List<Food> foods) {
        //todo 如果输入的食物信息已经存在，则实现更新操作，如果输入的事务不存在则直接执行插入操作
        if (foods != null && foods.size() > 0) {
            for (Food food : foods) {
                //检查输入的食物是否存在
                int count = foodDao.findCountByFoodName(food);
                if (count > 0) {
                    //修改信息
                    foodDao.edit(food);
                }else {
                    //插入信息
                    foodDao.add(food);
                }
            }
        }
    }

    @Override
    public List<Food> findAll() {
        return foodDao.findAll();
    }
}
