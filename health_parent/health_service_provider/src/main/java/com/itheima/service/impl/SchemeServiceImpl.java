package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.itheima.dao.SchemeDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;

import com.itheima.pojo.Food;
import com.itheima.pojo.Scheme;
import com.itheima.service.SchemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 干预方案
 */
@Service(interfaceClass = SchemeService.class)
@Transactional
public class SchemeServiceImpl implements SchemeService {
    @Autowired
    private SchemeDao schemeDao;

    //分页查询
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<Scheme> page = schemeDao.selectByCondition(queryString);
        long total = page.getTotal();
        List<Scheme> rows = page.getResult();

        return new PageResult(total,rows);
    }

    //添加
    public void add(Scheme scheme) {
        schemeDao.add(scheme);
    }

    //根据id查询 实现数据回显
    public Scheme findById(Integer id) {
        return schemeDao.findById(id);
    }

    //修改
    public void edit(Scheme scheme) {
        schemeDao.edit(scheme);
    }

    //删除
    public void delete(Integer id) {
        schemeDao.delete(id);
    }
}
