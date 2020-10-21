package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Food;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface FoodService {
    public Food findById(Integer id);

    public PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    void add(Food food);

    void delete(Integer id);

    void edit(Food food);

    void save(List<Food> foods);

    List<Food> findAll();

}
